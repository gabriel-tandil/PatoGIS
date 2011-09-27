package ar.edu.unicen.exa.galvarez.patogis.client;

import gwtupload.client.IFileInput.FileInputType;
import gwtupload.client.IUploadStatus.Status;
import gwtupload.client.IUploader;
import gwtupload.client.IUploader.UploadedInfo;
import gwtupload.client.PreloadedImage;
import gwtupload.client.PreloadedImage.OnLoadPreloadedImageHandler;
import gwtupload.client.SingleUploader;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.AlcanceEnum;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ConteoEnum;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.DistanciaEnum;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.EdadEnum;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.EstadoEnum;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.FiabilidadEnum;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.NubesEnum;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionClima;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionEspecie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionFoto;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionMatrizProductiva;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.TipoFotoEnum;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.TipoMatrizProductiva;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Ubicacion;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.VientoEnum;
import ar.edu.unicen.exa.galvarez.patogis.shared.MapaOrdenado;

import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ChangeEvent;
import com.google.gwt.event.dom.client.ChangeHandler;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.event.dom.client.KeyPressEvent;
import com.google.gwt.event.dom.client.KeyPressHandler;
import com.google.gwt.i18n.client.DateTimeFormat;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.CheckBox;
import com.google.gwt.user.client.ui.DoubleBox;
import com.google.gwt.user.client.ui.FlexTable;
import com.google.gwt.user.client.ui.FlowPanel;
import com.google.gwt.user.client.ui.Grid;
import com.google.gwt.user.client.ui.HasVerticalAlignment;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.IntegerBox;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.ListBox;
import com.google.gwt.user.client.ui.TextArea;
import com.google.gwt.user.client.ui.VerticalPanel;
import com.google.gwt.user.datepicker.client.DateBox;
import com.google.gwt.user.datepicker.client.DateBox.DefaultFormat;

public class VentanaCarga extends FlexTable {
	VentanaCargaConstantes ctes = GWT.create(VentanaCargaConstantes.class);
	EnumConstantes constantesEnum = GWT.create(EnumConstantes.class);

	class AgregarEspecieDialog extends AgregarElementoDialog {

		public AgregarEspecieDialog() {

			setText(ctes.ingresarNuevaEspecie());
		}

		protected void grabar() {
			Especie e = new Especie();
			e.setNombre(text.getValue());
			especiesService.addElemento(e, new AsyncCallback<Void>() {
				public void onFailure(Throwable caught) {
					AplicacionWeb.setMensajeAlerta(ctes.errorGuardarEspecie());
				}

				@Override
				public void onSuccess(Void result) {
					// nada

				}
			});
			especies.put(text.getValue(), e);
			establecerElementoCombo(combo, text.getValue());
			hide();
		}
	}

	class AgregarTipoMatrizProductivaDialog extends AgregarElementoDialog {

		public AgregarTipoMatrizProductivaDialog() {

			setText(ctes.ingresarNuevoTipoMatrizProductiva());
		}

		protected void grabar() {
			TipoMatrizProductiva tmp = new TipoMatrizProductiva();
			tmp.setNombre(text.getValue());
			tipoMatrizProductivaService.addElemento(tmp,
					new AsyncCallback<Void>() {
						public void onFailure(Throwable caught) {
							AplicacionWeb.setMensajeAlerta(ctes
									.errorGuardarNuevoTipoMatrizProductiva());
						}

						@Override
						public void onSuccess(Void result) {
							// nada

						}
					});
			tiposMatrizProductiva.put(text.getValue(), tmp);
			establecerElementoCombo(combo, text.getValue());
			hide();
		}

	}

	class AgregarUbicacionDialog extends AgregarElementoDialog {

		public AgregarUbicacionDialog() {

			setText(ctes.ingresarNuevaUbicacion());
		}

		protected void grabar() {
			Ubicacion u = new Ubicacion();
			u.setNombre(text.getValue());
			ubicacionService.addElemento(u, new AsyncCallback<Void>() {
				public void onFailure(Throwable caught) {
					AplicacionWeb.setMensajeAlerta(ctes
							.errorGuardarNuevaUbicacion());
				}

				@Override
				public void onSuccess(Void result) {
					// nada

				}
			});
			ubicaciones.put(text.getValue(), u);
			establecerElementoCombo(combo, text.getValue());
			hide();
		}

	}

	final ArchivosServiceAsync archivosService = GWT
			.create(ArchivosService.class);
	private CheckBox checkLluvia;
	private DoubleBox temperatura;
	private CheckBox checkSol;
	private ListBox comboNuves;
	private ListBox comboViento;
	private ListBox alcance;
	private DateBox dateBox;
	private SingleUploader uploader;
	private Label labelFotos;
	MapaOrdenado<String, Especie> especies = new MapaOrdenado<String, Especie>();

	final EspeciesServiceAsync especiesService = GWT
			.create(EspeciesService.class);
	private TimeBox horaFin;
	private TimeBox horaInicio;
	private List<String> imagenes = new ArrayList<String>();
	private ListBox laguna;
	private TextArea observaciones;
	final ObservacionServiceAsync observacionService = GWT
			.create(ObservacionService.class);
	// Load the image in the document and in the case of success attach it to
	// the viewer
	private IUploader.OnFinishUploaderHandler onFinishUploaderHandler = new IUploader.OnFinishUploaderHandler() {
		public void onFinish(IUploader uploader) {
			if (uploader.getStatus() == Status.SUCCESS) {

				new PreloadedImage(uploader.fileUrl(), showImage);

				// The server sends useful information to the client by default
				UploadedInfo info = uploader.getServerInfo();
				System.out.println("File name " + info.name);
				System.out.println("File content-type " + info.ctype);
				System.out.println("File size " + info.size);

				// Also, you can send any customized message and parse it
				System.out.println("Nombre Salvado " + info.message);
				imagenes.add(info.message);
			}
		}
	};
	private FlowPanel panelImages = new FlowPanel();
	// Attach an image to the pictures viewer
	private OnLoadPreloadedImageHandler showImage = new OnLoadPreloadedImageHandler() {
		@SuppressWarnings("deprecation")
		public void onLoad(PreloadedImage image) {
			image.setWidth("75px");
			final HorizontalPanel hp = new HorizontalPanel();
			hp.add(image);
			VerticalPanel vp = new VerticalPanel();

			CheckBox cb = new CheckBox();
			cb.addMouseListener(new TooltipListener(ctes.panoramicaTooltip(),
					5000));
			cb.setText(ctes.panoramica());
			vp.add(cb);
			Button borrar = new Button(ctes.eliminarFoto());
			borrar.addMouseListener(new TooltipListener(ctes
					.borrarImagenTooltip(), 5000));
			borrar.addClickHandler(new ClickHandler() {
				String imagen = imagenes.get(imagenes.size() - 1);

				public void onClick(ClickEvent event) {
					borrarImagen(imagen);
					panelImages.remove(hp);
				}
			});
			vp.add(borrar);
			hp.add(vp);
			panelImages.add(hp);
		}
	};
	final TipoMatrizProductivaServiceAsync tipoMatrizProductivaService = GWT
			.create(TipoMatrizProductivaService.class);

	MapaOrdenado<String, TipoMatrizProductiva> tiposMatrizProductiva = new MapaOrdenado<String, TipoMatrizProductiva>();

	MapaOrdenado<String, Ubicacion> ubicaciones = new MapaOrdenado<String, Ubicacion>();

	final UbicacionServiceAsync ubicacionService = GWT
			.create(UbicacionService.class);

	private List<VerticalPanel> widgetsObsEspecie = new ArrayList<VerticalPanel>();

	private List<HorizontalPanel> widgetsObsMatrizProductiva = new ArrayList<HorizontalPanel>();

	class ObtenerPropiedadEspecie implements ObtenerTexto {
		@Override
		public String getValor(String clave) {
			return (AplicacionWeb.configuracion.isNombreCientifico() ? especies
					.get(clave).getNombreCientifico() : clave);
		}
	};
	class ObtenerTextoUbicacion implements ObtenerTexto {
		@Override
		public String getValor(String clave) {
			return (ubicaciones.get(clave).getNombre()+" ("+ ubicaciones.get(clave).getCoordenadas()+")");
		}
	};
	
	class ComparadorTipoMatrizProductiva implements Comparator<String> {
		public int compare(String arg0, String arg1) {
			try {
				TipoMatrizProductiva argE0 = tiposMatrizProductiva.get(arg0);
				TipoMatrizProductiva argE1 = tiposMatrizProductiva.get(arg1);
				if (argE0.getCantidadObservaciones() == null
						&& argE1.getCantidadObservaciones() == null)
					return argE0.getNombre()
							.compareTo(
									argE1.getNombre());
				if (argE1.getCantidadObservaciones() == null)
					return 0;
				if (argE0.getCantidadObservaciones() == null)
					return 1;

				if (argE0.getCantidadObservaciones() > argE1
						.getCantidadObservaciones())
					return 0;
				if (argE0.getCantidadObservaciones() < argE1
						.getCantidadObservaciones())
					return 1;
				return argE0.getNombre()
				.compareTo(
						argE1.getNombre());
			} catch (Exception e) {
				return 0; // por las dudas
			}

		}
	};	
	
	class ComparadorEspecies implements Comparator<String> {
		public int compare(String arg0, String arg1) {
			try {
				Especie argE0 = especies.get(arg0);
				Especie argE1 = especies.get(arg1);
				if (argE0.getGrupo().compareTo(argE1.getGrupo()) != 0)
					return argE0.getGrupo().compareTo(argE1.getGrupo());
				if (argE0.getFamilia().compareTo(argE1.getFamilia()) != 0)
					return argE0.getFamilia().compareTo(argE1.getFamilia());
				if (argE0.getCantidadObservaciones() == null
						&& argE1.getCantidadObservaciones() == null)
					return new ObtenerPropiedadEspecie().getValor(arg0)
							.compareTo(
									new ObtenerPropiedadEspecie()
											.getValor(arg1));
				if (argE1.getCantidadObservaciones() == null)
					return 0;
				if (argE0.getCantidadObservaciones() == null)
					return 1;

				if (argE0.getCantidadObservaciones() > argE1
						.getCantidadObservaciones())
					return 0;
				if (argE0.getCantidadObservaciones() < argE1
						.getCantidadObservaciones())
					return 1;
				return new ObtenerPropiedadEspecie().getValor(arg0).compareTo(
						new ObtenerPropiedadEspecie().getValor(arg1));
			} catch (Exception e) {
				return 0; // por las dudas
			}

		}
	};

	@SuppressWarnings("deprecation")
	VentanaCarga() {
		super();
		setSize("100px", "100px");

		Label lblNewLabel = new Label(ctes.laguna());
		setWidget(0, 0, lblNewLabel);
		laguna = generarComboItemsObservables(ubicaciones.keyList(),
				new AgregarUbicacionDialog());
		laguna.addMouseListener(new TooltipListener(ctes.lagunaTooltip(), 5000));
		especiesService.getElementos(new AsyncCallback<Map<String, Especie>>() {
			public void onFailure(Throwable caught) {
				if (!AplicacionWeb.contexto.isMostroWarningEspeciesOffline()) // si
																				// estaba
																				// AplicacionWeb.online
					// aviso que tomare las locales
					AplicacionWeb.setMensajeAlerta(ctes.errorObtenerEspecies());
				AplicacionWeb.contexto.setMostroWarningEspeciesOffline(true);
				especies = ManejadorAlmacenamientoLocal.obtenerMapaEspecies();
				cambiarAModoOffLine();
				llenarCombosEspecies();
			}

			@Override
			public void onSuccess(Map<String, Especie> result) {
				especies = (MapaOrdenado<String, Especie>) result;
				ManejadorAlmacenamientoLocal.persistirMapaEspecies(especies);
				llenarCombosEspecies();
				cambiarAModoOnLine();
			}

			private void llenarCombosEspecies() {
				especies.ordenarClaves(new ComparadorEspecies());
				for (Iterator<VerticalPanel> iterator = widgetsObsEspecie
						.iterator(); iterator.hasNext();) {
					VerticalPanel hp = iterator.next();
					ListBox combo = (ListBox) ((HorizontalPanel) hp
							.getWidget(0)).getWidget(0);
					if (combo.getSelectedIndex() <= 0)
						agregarItemsCombo(combo, especies.keyList(),
								new ObtenerPropiedadEspecie());
				}
			}

		});

		tipoMatrizProductivaService
				.getElementos(new AsyncCallback<Map<String, TipoMatrizProductiva>>() {
					public void onFailure(Throwable caught) {
						if (!AplicacionWeb.contexto
								.isMostroWarningTiposMatrizProductivaOffline()) // si
																				// estaba
							// AplicacionWeb.online
							// aviso que tomare las
							// locales
							AplicacionWeb.setMensajeAlerta(ctes
									.errorObtenerTiposMatrizProductiva());
						AplicacionWeb.contexto
								.setMostroWarningTiposMatrizProductivaOffline(true);
						tiposMatrizProductiva = ManejadorAlmacenamientoLocal
								.obtenerMapaTiposMatrizProductiva();
						cambiarAModoOffLine();
						llenarCombosTipoMatrizProductiva();
					}

					@Override
					public void onSuccess(
							Map<String, TipoMatrizProductiva> result) {
						tiposMatrizProductiva = (MapaOrdenado<String, TipoMatrizProductiva>) result;
						ManejadorAlmacenamientoLocal
								.persistirMapaTiposMatrizProductiva(tiposMatrizProductiva);
						llenarCombosTipoMatrizProductiva();
						cambiarAModoOnLine();
					}

					private void llenarCombosTipoMatrizProductiva() {
						tiposMatrizProductiva.ordenarClaves(new ComparadorTipoMatrizProductiva());
						for (Iterator<HorizontalPanel> iterator = widgetsObsMatrizProductiva
								.iterator(); iterator.hasNext();) {
							HorizontalPanel hp = iterator.next();
							ListBox combo = (ListBox) hp.getWidget(0);
							if (combo.getSelectedIndex() <= 0)
								agregarItemsCombo(combo,
										tiposMatrizProductiva.keyList());
						}
					}

				});
		ubicacionService
				.getElementos(new AsyncCallback<Map<String, Ubicacion>>() {
					public void onFailure(Throwable caught) {
						if (!AplicacionWeb.contexto
								.isMostroWarningUbicacionesOffline()) // si
																		// estaba
							// AplicacionWeb.online
							// aviso que tomare las
							// locales
							AplicacionWeb.setMensajeAlerta(ctes
									.errorObtenerUbicaciones());
						AplicacionWeb.contexto
								.setMostroWarningUbicacionesOffline(true);
						ubicaciones = ManejadorAlmacenamientoLocal
								.obtenerMapaUbicacions();
						cambiarAModoOffLine();
						if (laguna.getSelectedIndex() <= 0)
							agregarItemsCombo(laguna, ubicaciones.keyList(), new ObtenerTextoUbicacion());
					}

					@Override
					public void onSuccess(Map<String, Ubicacion> result) {
						ubicaciones = (MapaOrdenado<String, Ubicacion>) result;
						ubicaciones.ordenarClaves();
						ManejadorAlmacenamientoLocal
								.persistirMapaUbicacions(ubicaciones);
						if (laguna.getSelectedIndex() <= 0)
							agregarItemsCombo(laguna, ubicaciones.keyList(), new ObtenerTextoUbicacion());
						cambiarAModoOnLine();
					}

				});

		setWidget(0, 1, laguna);

		Label lblNewLabel_1 = new Label(ctes.fechaYHoras());
		setWidget(1, 0, lblNewLabel_1);
		HorizontalPanel horizontalPanel1 = new HorizontalPanel();
		dateBox = new DateBox();
		dateBox.setWidth("70px");
		setWidget(1, 1, horizontalPanel1);
		dateBox.setFormat(new DefaultFormat(DateTimeFormat.getFormat(ctes
				.formatoFechaCorta())));
		dateBox.setValue(new Date());

		horaInicio = new TimeBox();
		horaInicio.setWidth("45px");
		// horaInicio.setValue(DateTimeFormat.getFormat(ctes.formatoHora())
		// .format(new Date()));
		horaInicio.addMouseListener(new TooltipListener(ctes
				.horaInicioTooltip(), 5000));
		horaFin = new TimeBox();
		horaFin.setWidth("45px");
		horaFin.setValue(DateTimeFormat.getFormat(ctes.formatoHora()).format(
				new Date()));
		horaFin.addMouseListener(new TooltipListener(ctes.horaFinTooltip(),
				5000));

		horizontalPanel1.add(dateBox);
		horizontalPanel1.add(horaInicio);
		horizontalPanel1.add(horaFin);

		Label lblNewLabel_9 = new Label(ctes.alcance());
		setWidget(2, 0, lblNewLabel_9);

		alcance = comboAlcance();
		alcance.addMouseListener(new TooltipListener(ctes.alcanceTooltip(),
				5000));
		setWidget(2, 1, alcance);
		Label lblNewLabel_2 = new Label(ctes.conteoEspecie());
		setWidget(3, 0, lblNewLabel_2);

		final VerticalPanel verticalPanel_1 = new VerticalPanel();
		setWidget(3, 1, verticalPanel_1);
		agregarObservacionEspecie(verticalPanel_1);

		Button button = new Button(ctes.agregar());
		button.addMouseListener(new TooltipListener(ctes
				.agregarObservacionEspecieTooltip(), 5000));
		setWidget(3, 2, button);
		button.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				agregarObservacionEspecie(verticalPanel_1);
			}
		});
		// We can add style names to widgets

		getCellFormatter().setVerticalAlignment(2, 2,
				HasVerticalAlignment.ALIGN_BOTTOM);
		getCellFormatter().setVerticalAlignment(2, 0,
				HasVerticalAlignment.ALIGN_TOP);

		Label lblNewLabel_3 = new Label(ctes.matrizProductiva());
		setWidget(4, 0, lblNewLabel_3);

		final VerticalPanel verticalPanel_2 = new VerticalPanel();
		setWidget(4, 1, verticalPanel_2);
		agregarObservacionMatrizProductiva(verticalPanel_2);

		Button button2 = new Button(ctes.agregar());
		button2.addMouseListener(new TooltipListener(ctes
				.agregarObservacionMatrizProductivaTooltip(), 5000));
		setWidget(4, 2, button2);
		button2.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				agregarObservacionMatrizProductiva(verticalPanel_2);
			}
		});

		getCellFormatter().setVerticalAlignment(3, 2,
				HasVerticalAlignment.ALIGN_BOTTOM);
		getCellFormatter().setVerticalAlignment(3, 0,
				HasVerticalAlignment.ALIGN_TOP);

		Label lblNewLabel0 = new Label(ctes.clima());
		setWidget(5, 0, lblNewLabel0);
		Grid grid2 = new Grid(3, 4);

		Label lblNewLabel1 = new Label(ctes.sol());
		checkSol = new CheckBox();

		grid2.setWidget(0, 0, lblNewLabel1);
		grid2.setWidget(0, 1, checkSol);

		Label lblNewLabel3 = new Label(ctes.nubes());

		comboNuves = comboNubes();

		grid2.setWidget(0, 2, lblNewLabel3);
		grid2.setWidget(0, 3, comboNuves);

		Label lblNewLabel2 = new Label(ctes.lluvia());
		checkLluvia = new CheckBox();
		grid2.setWidget(1, 0, lblNewLabel2);
		grid2.setWidget(1, 1, checkLluvia);

		Label lblNewLabel4 = new Label(ctes.viento());

		comboViento = comboViento();
		grid2.setWidget(1, 2, lblNewLabel4);
		grid2.setWidget(1, 3, comboViento);
		Label lblNewLabel5 = new Label(ctes.temperatura());
		Label lblNewLabel6 = new Label(ctes.grados());
		temperatura = new DoubleBox();
		temperatura.setWidth("20px");
		temperatura.setValue(20.0);
		grid2.setWidget(2, 0, lblNewLabel5);
		grid2.setWidget(2, 2, temperatura);
		grid2.setWidget(2, 3, lblNewLabel6);
		setWidget(5, 1, grid2);

		Label lblNewLabel7 = new Label(ctes.observaciones());

		setWidget(6, 0, lblNewLabel7);
		observaciones = new TextArea();
		observaciones.addKeyPressHandler(new KeyPressHandler() {

			@Override
			public void onKeyPress(KeyPressEvent event) {
				if (observaciones.getText().length() > 100) {
					observaciones.setText(observaciones.getText().substring(0,
							99));
				}

			};
		});
		setWidget(6, 1, observaciones);

		labelFotos = new Label(ctes.fotos());

		setWidget(7, 0, labelFotos);

		uploader = new SingleUploader(FileInputType.BUTTON);

		uploader.setI18Constants(new UploaderConstantsImpl());
		uploader.setAutoSubmit(true);
		uploader.setEnabled(true);
		uploader.setAvoidRepeatFiles(true);
		uploader.addOnFinishUploadHandler(onFinishUploaderHandler);
		uploader.setValidExtensions("jpg", "jpeg", "png", "gif");
		setWidget(7, 1, uploader);

		setWidget(8, 1, panelImages);

		final Button sendButton = new Button(ctes.enviar());
		sendButton.addMouseListener(new TooltipListener(ctes.enviarTooltip(),
				5000));
		sendButton.addStyleName("sendButton");
		sendButton.addClickHandler(new ClickHandler() {

			public void onClick(ClickEvent event) {
				final Observacion observacion;
				try {
					observacion = getObservacion();

					observacionService.addElemento(observacion,
							new AsyncCallback<Void>() {

								@Override
								public void onFailure(Throwable caught) {
									AplicacionWeb.setMensajeAlerta(ctes
											.observacionGuardadaLocalmente());
									ManejadorAlmacenamientoLocal
											.persistirObservacion(observacion);
									AplicacionWeb
											.actualizarCantidadObservacionesLocales();
									AplicacionWeb.cargarObservacion();
								}

								@Override
								public void onSuccess(Void result) {
									AplicacionWeb.setMensajeAlerta(ctes
											.observacionGuardada());
									AplicacionWeb.cargarObservacion();

								}
							});

				} catch (ValidacionException e) {
					AplicacionWeb.setMensajeAlerta(e.getMensaje());
				}
			}
		});
		setWidget(9, 1, sendButton);

		laguna.setFocus(true);
	}

	protected void cambiarAModoOnLine() {
		AplicacionWeb.contexto.setOnline(true);
		AplicacionWeb.contexto.setMostroWarningEspeciesOffline(true);
		AplicacionWeb.contexto
				.setMostroWarningTiposMatrizProductivaOffline(true);
		AplicacionWeb.contexto.setMostroWarningUbicacionesOffline(true);
		uploader.setVisible(true);
		labelFotos.setVisible(true);
	}

	protected void cambiarAModoOffLine() {
		AplicacionWeb.contexto.setOnline(false);
		uploader.setVisible(false);
		labelFotos.setVisible(false);
	}

	interface ObtenerTexto {
		public abstract String getValor(String clave);
	}

	class ObtenerMismoTexto implements ObtenerTexto {
		public String getValor(String clave) {
			return clave;
		}
	}

	private void agregarItemsCombo(final ListBox comboBox, Collection<String> list) {
		agregarItemsCombo(comboBox, list, new ObtenerMismoTexto());
	}

	private void agregarItemsCombo(final ListBox comboBox,
			Collection<String> list, ObtenerTexto obtenerPropiedad) {
		comboBox.clear();
		comboBox.addItem(ctes.seleccionar());
		for (Iterator<String> iterator = list.iterator(); iterator.hasNext();) {
			String especie = iterator.next();
			comboBox.addItem(obtenerPropiedad.getValor(especie), especie);
		}
		comboBox.setItemSelected(0, true);
		if (AplicacionWeb.contexto.isOnline())
			comboBox.addItem(ctes.otra());
	}

	@SuppressWarnings("deprecation")
	private void agregarObservacionEspecie(final VerticalPanel verticalPanel_1) {
		VerticalPanel verticalPanel = new VerticalPanel();
		if (widgetsObsEspecie.size() > 0)
			verticalPanel_1.setBorderWidth(1);
		verticalPanel_1.add(verticalPanel);
		HorizontalPanel horizontalPanel = new HorizontalPanel();
		verticalPanel.add(horizontalPanel);
		especies.ordenarClaves(new ComparadorEspecies());
		final ListBox comboBox1 = generarComboItemsObservables(
				especies.keyList(), new AgregarEspecieDialog(),
				new ObtenerPropiedadEspecie());

		horizontalPanel.add(comboBox1);

		IntegerBox textBox_1 = new IntegerBox();
		textBox_1.setWidth("35px");
		textBox_1.setMaxLength(4);
		horizontalPanel.add(textBox_1);

		HorizontalPanel horizontalPanel2 = new HorizontalPanel();
		verticalPanel.add(horizontalPanel2);
		ListBox edad = comboEdad();
		edad.addMouseListener(new TooltipListener(ctes.edadTooltip(), 5000));
		horizontalPanel2.add(edad);
		ListBox distancia = comboDistancia();
		distancia.addMouseListener(new TooltipListener(ctes.distanciaTooltip(),
				5000));
		horizontalPanel2.add(distancia);

		ListBox conteo = comboConteo();
		conteo.addMouseListener(new TooltipListener(ctes.conteoTooltip(), 5000));
		horizontalPanel2.add(conteo);

		widgetsObsEspecie.add(verticalPanel);
	}

	private void agregarObservacionMatrizProductiva(
			final VerticalPanel verticalPanel_1) {
		HorizontalPanel horizontalPanel1 = new HorizontalPanel();
		if (widgetsObsMatrizProductiva.size() > 0)
			verticalPanel_1.setBorderWidth(1);
		verticalPanel_1.add(horizontalPanel1);

		final ListBox comboBox = generarComboItemsObservables(
				tiposMatrizProductiva.keyList(),
				new AgregarTipoMatrizProductivaDialog());

		horizontalPanel1.add(comboBox);

		IntegerBox textBox_1 = new IntegerBox();
		textBox_1.setWidth("25px");
		textBox_1.setMaxLength(3);
		horizontalPanel1.add(textBox_1);
		widgetsObsMatrizProductiva.add(horizontalPanel1);
		Label l = new Label("%");
		horizontalPanel1.add(l);
	}

	private void borrarImagen(String imagen) {

		archivosService.borrar(imagen, new AsyncCallback<Void>() {
			public void onFailure(Throwable caught) {

				AplicacionWeb.setMensajeAlerta(ctes.errorEliminarArchivo());
			}

			@Override
			public void onSuccess(Void result) {
				// nada

			}
		});
	}

	private ListBox comboConteo() {
		ListBox conteo = new ListBox();
		for (int i = 0; i < ConteoEnum.values().length; i++) {
			ConteoEnum e = ConteoEnum.values()[i];
			conteo.addItem(constantesEnum.getString("ConteoEnum_" + e),
					e.toString());
		}
		return conteo;
	}

	private ListBox comboDistancia() {
		ListBox distancia = new ListBox();
		for (int i = 0; i < DistanciaEnum.values().length; i++) {
			DistanciaEnum e = DistanciaEnum.values()[i];
			distancia.addItem(constantesEnum.getString("DistanciaEnum_" + e),
					e.toString());
		}
		return distancia;
	}

	private ListBox comboEdad() {
		ListBox edad = new ListBox();
		for (int i = 0; i < EdadEnum.values().length; i++) {
			EdadEnum e = EdadEnum.values()[i];
			edad.addItem(constantesEnum.getString("EdadEnum_" + e),
					e.toString());
		}
		edad.setSelectedIndex(2);
		return edad;
	}

	private ListBox comboNubes() {
		ListBox comboNuves = new ListBox();
		for (int i = 0; i < NubesEnum.values().length; i++) {
			NubesEnum ne = NubesEnum.values()[i];
			comboNuves.addItem(constantesEnum.getString("NubesEnum_" + ne),
					ne.toString());
		}
		comboNuves.setSelectedIndex(1);
		return comboNuves;
	}

	private ListBox comboViento() {
		ListBox comboViento = new ListBox();
		for (int i = 0; i < VientoEnum.values().length; i++) {
			VientoEnum ve = VientoEnum.values()[i];
			comboViento.addItem(
					constantesEnum.getString("VientoEnum_" + ve.toString()),
					ve.toString());
		}
		comboViento.setSelectedIndex(1);
		return comboViento;
	}

	private ListBox comboAlcance() {
		ListBox comboAlcance = new ListBox();
		for (int i = 0; i < AlcanceEnum.values().length; i++) {
			AlcanceEnum ve = AlcanceEnum.values()[i];
			comboAlcance.addItem(
					constantesEnum.getString("AlcanceEnum_" + ve.toString()),
					ve.toString());
		}
		comboAlcance.setSelectedIndex(1);
		return comboAlcance;
	}

	void establecerElementoCombo(ListBox combo, String especie) {
		combo.addItem(especie);
		combo.setSelectedIndex(combo.getItemCount() - 1);
	}

	private ListBox generarComboItemsObservables(List<String> items,
			final AgregarElementoDialog dlg) {
		return generarComboItemsObservables(items, dlg, new ObtenerMismoTexto());
	}

	private ListBox generarComboItemsObservables(List<String> items,
			final AgregarElementoDialog dlg, ObtenerTexto obtenerPropiedad) {
		final ListBox comboBox = new ListBox();

		comboBox.addChangeHandler(new ChangeHandler() {

			public void onChange(ChangeEvent event) {

				if (comboBox.getItemText(comboBox.getSelectedIndex()).equals(
						ctes.otra())) {

					dlg.setCombo(comboBox);
					dlg.center();

				}
			}
		});
		if (!items.isEmpty()) {
			agregarItemsCombo(comboBox, items, obtenerPropiedad);
		}
		return comboBox;
	}

	private ObservacionClima getObservacionClima() {
		ObservacionClima oc = new ObservacionClima();
		oc.setLluvia(checkLluvia.getValue());
		oc.setSol(checkSol.getValue());
		oc.setNubes(comboNuves.getValue(comboNuves.getSelectedIndex()));
		oc.setViento(comboViento.getValue(comboViento.getSelectedIndex()));
		oc.setTemperatura(temperatura.getValue());
		return oc;
	}

	private ObservacionEspecie getObservacionEspecie(VerticalPanel vp)
			throws ValidacionException {
		if (((IntegerBox) ((HorizontalPanel) vp.getWidget(0)).getWidget(1))
				.getValue() != null) {
			ObservacionEspecie oe = new ObservacionEspecie();

			if (((ListBox) ((HorizontalPanel) vp.getWidget(0)).getWidget(0))
					.getSelectedIndex() <= 0)// debe seleccionar especie
				throw new ValidacionException(ctes.validacionEspecie());

			oe.setCantidad(((IntegerBox) ((HorizontalPanel) vp.getWidget(0))
					.getWidget(1)).getValue());
			oe.setIdEspecie(especies.get(
					(((ListBox) ((HorizontalPanel) vp.getWidget(0))
							.getWidget(0))
							.getValue(((ListBox) ((HorizontalPanel) vp
									.getWidget(0)).getWidget(0))
									.getSelectedIndex()))).getId());
			oe.setEdad(((ListBox) ((HorizontalPanel) vp.getWidget(1))
					.getWidget(0)).getValue(((ListBox) ((HorizontalPanel) vp
					.getWidget(1)).getWidget(0)).getSelectedIndex()));
			oe.setDistancia(((ListBox) ((HorizontalPanel) vp.getWidget(1))
					.getWidget(1)).getValue(((ListBox) ((HorizontalPanel) vp
					.getWidget(1)).getWidget(1)).getSelectedIndex()));
			oe.setConteo(((ListBox) ((HorizontalPanel) vp.getWidget(1))
					.getWidget(2)).getValue(((ListBox) ((HorizontalPanel) vp
					.getWidget(1)).getWidget(2)).getSelectedIndex()));
			return oe;
		}
		return null;
	}

	private ObservacionFoto getObservacionFoto(int i) {
		ObservacionFoto observacionFoto = new ObservacionFoto();
		observacionFoto.setNombreArchivo(imagenes.get(i));
		observacionFoto
				.setTipo((((CheckBox) ((VerticalPanel) ((HorizontalPanel) panelImages
						.getWidget(i)).getWidget(1)).getWidget(0)).getValue() == Boolean.TRUE ? TipoFotoEnum.Panoramica
						.toString() : TipoFotoEnum.Normal.toString()));
		return (observacionFoto);
	}

	private ObservacionMatrizProductiva getObservacionMatrizProductiva(
			HorizontalPanel hp) throws ValidacionException {
		if (((IntegerBox) hp.getWidget(1)).getValue() != null) {
			if (((ListBox) hp.getWidget(0)).getSelectedIndex() <= 0)
				throw new ValidacionException(
						ctes.validacionTipoMatrizProductiva());

			ObservacionMatrizProductiva omp = new ObservacionMatrizProductiva();
			omp.setIdTipoMatrizProductiva(tiposMatrizProductiva.get(
					(((ListBox) hp.getWidget(0)).getValue(((ListBox) hp
							.getWidget(0)).getSelectedIndex()))).getId());
			omp.setPorcentaje(((IntegerBox) hp.getWidget(1)).getValue());

			return omp;
		}
		return null;
	}

	private Ubicacion getUbicacion() throws ValidacionException {
		if (laguna.getSelectedIndex() <= 0)
			throw new ValidacionException(ctes.validacionLaguna());
		return ubicaciones.get(laguna.getValue(laguna.getSelectedIndex()));
	}

	@SuppressWarnings("deprecation")
	private Observacion getObservacion() throws ValidacionException {

		Observacion observacion = new Observacion();
		observacion.setObservaciones(observaciones.getValue());
		observacion.setEstado(EstadoEnum.ARevisar.toString());// TODO: asociar
																// al usuario
		observacion.setAlcance(alcance.getValue(alcance.getSelectedIndex()));
		observacion.setFiabilidad(FiabilidadEnum.Fiable.toString());// TODO:
																	// asociar
																	// al
																	// usuario
		observacion.setIdCampana(1);
		observacion.setIdUsuario(1);
		observacion.setIdUsuarioApoyo(1);

		observacion.setIdUbicacion(getUbicacion().getId());

		observacion.setObservacionClima(getObservacionClima());
		List<ObservacionEspecie> observacionesEspecie = new ArrayList<ObservacionEspecie>();

		for (int i = 0; i < widgetsObsEspecie.size(); i++) {
			ObservacionEspecie oe = getObservacionEspecie(widgetsObsEspecie
					.get(i));
			if (oe != null) {
				observacionesEspecie.add(oe);
			}
		}
		observacion.setObservacionesEspecie(observacionesEspecie
				.toArray(new ObservacionEspecie[observacionesEspecie.size()]));

		List<ObservacionMatrizProductiva> obsMatrizProductiva = new ArrayList<ObservacionMatrizProductiva>();
		for (int i = 0; i < widgetsObsMatrizProductiva.size(); i++) {
			ObservacionMatrizProductiva omp = getObservacionMatrizProductiva(widgetsObsMatrizProductiva
					.get(i));

			if (omp != null) {
				obsMatrizProductiva.add(omp);
			}
		}
		observacion.setObservacionesMatrizProductiva(obsMatrizProductiva
				.toArray(new ObservacionMatrizProductiva[obsMatrizProductiva
						.size()]));

		ObservacionFoto[] observacionesFoto = new ObservacionFoto[imagenes
				.size()];
		for (int i = 0; i < imagenes.size(); i++) {
			observacionesFoto[i] = getObservacionFoto(i);
		}
		observacion.setObservacionesFoto(observacionesFoto);
		if (ctes.formatoHora().equals(horaInicio.getValue()))
			throw new ValidacionException(ctes.validacionHoraInicio());
		try {
			Date fecha = new Date(dateBox.getValue().getYear(), dateBox
					.getValue().getMonth(), dateBox.getValue().getDate(),
					DateTimeFormat.getFormat(ctes.formatoHora())
							.parse(horaInicio.getValue()).getHours(),
					DateTimeFormat.getFormat(ctes.formatoHora())
							.parse(horaInicio.getValue()).getMinutes());
			observacion.setInicio(fecha);
			fecha = new Date(dateBox.getValue().getYear(), dateBox.getValue()
					.getMonth(), dateBox.getValue().getDate(), DateTimeFormat
					.getFormat(ctes.formatoHora()).parse(horaFin.getValue())
					.getHours(), DateTimeFormat.getFormat(ctes.formatoHora())
					.parse(horaFin.getValue()).getMinutes());
			observacion.setFin(fecha);
		} catch (Exception e) {
			throw new ValidacionException(ctes.validacionFechaYHoras());
		}

		return observacion;
	}

}

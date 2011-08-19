package ar.edu.unicen.exa.galvarez.patogis.client;

import gwtupload.client.IFileInput.FileInputType;
import gwtupload.client.IUploadStatus.Status;
import gwtupload.client.IUploader;
import gwtupload.client.IUploader.UploadedInfo;
import gwtupload.client.PreloadedImage;
import gwtupload.client.PreloadedImage.OnLoadPreloadedImageHandler;
import gwtupload.client.SingleUploader;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ChangeEvent;
import com.google.gwt.event.dom.client.ChangeHandler;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.i18n.client.DateTimeFormat;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.CheckBox;
import com.google.gwt.user.client.ui.FlowPanel;
import com.google.gwt.user.client.ui.Grid;
import com.google.gwt.user.client.ui.HasVerticalAlignment;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.IntegerBox;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.ListBox;
import com.google.gwt.user.client.ui.RootPanel;
import com.google.gwt.user.client.ui.TextArea;
import com.google.gwt.user.client.ui.VerticalPanel;
import com.google.gwt.user.datepicker.client.DateBox;
import com.google.gwt.user.datepicker.client.DateBox.DefaultFormat;

public class VentanaCarga extends Grid {
	class AgregarEspecieDialog extends AgregarElementoDialog {

		public AgregarEspecieDialog() {

			setText(Messages.getString("VentanaCarga.IngresarNuevaEspecie")); //$NON-NLS-1$
		}

		protected void grabar() {
			Especie e = new Especie();
			e.setNombre(text.getValue());
			especiesService.addElemento(e, new AsyncCallback<Void>() {
				public void onFailure(Throwable caught) {
					errorLabel
							.setText(Messages.getString("VentanaCarga.errorGuardarEspecie")); //$NON-NLS-1$
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

			setText(Messages.getString("VentanaCarga.ingresarNuevoTipoMatrizProductiva")); //$NON-NLS-1$
		}

		protected void grabar() {
			TipoMatrizProductiva tmp = new TipoMatrizProductiva();
			tmp.setNombre(text.getValue());
			tipoMatrizProductivaService.addElemento(tmp,
					new AsyncCallback<Void>() {
						public void onFailure(Throwable caught) {
							errorLabel
									.setText(Messages.getString("VentanaCarga.errorGuardarNuevoTipoMatrizProductiva")); //$NON-NLS-1$
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

			setText(Messages.getString("VentanaCarga.ingresarNuevaUbicacion")); //$NON-NLS-1$
		}

		protected void grabar() {
			Ubicacion u = new Ubicacion();
			u.setNombre(text.getValue());
			ubicacionService.addElemento(u, new AsyncCallback<Void>() {
				public void onFailure(Throwable caught) {
					errorLabel
							.setText(Messages.getString("VentanaCarga.errorGuardarNuevaUbicacion")); //$NON-NLS-1$
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

	private CheckBox checkSol;
	private ListBox comboNuves;
	private ListBox comboViento;
	private DateBox dateBox;
	Map<String, Especie> especies = new HashMap<String, Especie>();

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
		public void onLoad(PreloadedImage image) {
			image.setWidth("75px");
			final HorizontalPanel hp = new HorizontalPanel();
			hp.add(image);
			VerticalPanel vp = new VerticalPanel();

			CheckBox cb = new CheckBox();
			cb.setText(Messages.getString("VentanaCarga.panoramica")); //$NON-NLS-1$
			vp.add(cb);Mensajes.INSTANCE.messages();
			Button borrar = new Button(Messages.getString("VentanaCarga.eliminarFoto")); //$NON-NLS-1$
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



	Map<String, TipoMatrizProductiva> tiposMatrizProductiva = new HashMap<String, TipoMatrizProductiva>();

	Map<String, Ubicacion> ubicaciones = new HashMap<String, Ubicacion>();

	final UbicacionServiceAsync ubicacionService = GWT
			.create(UbicacionService.class);

	private List<VerticalPanel> widgetsObsEspecie = new ArrayList<VerticalPanel>();

	private List<HorizontalPanel> widgetsObsMatrizProductiva = new ArrayList<HorizontalPanel>();

	@SuppressWarnings("deprecation")
	VentanaCarga() {
		super(12, 3);
		final Label errorLabel =(Label) RootPanel.get("errorLabelContainer").getWidget(0);
		setSize("100px", "100px");

		Label lblNewLabel = new Label(Messages.getString("VentanaCarga.laguna")); //$NON-NLS-1$
		setWidget(0, 0, lblNewLabel);
		laguna = generarComboItemsObservables(ubicaciones.keySet(),
				new AgregarUbicacionDialog());
		laguna.addMouseListener(new TooltipListener(
				Messages.getString("VentanaCarga.lafuna.tooltip"), 5000)); //$NON-NLS-1$
		especiesService.getElementos(new AsyncCallback<Map<String, Especie>>() {
			public void onFailure(Throwable caught) {
				errorLabel.setText(Messages.getString("VentanaCarga.errorObtenerEspecies")); //$NON-NLS-1$
			}

			@Override
			public void onSuccess(Map<String, Especie> result) {
				especies = result;
				for (Iterator<VerticalPanel> iterator = widgetsObsEspecie
						.iterator(); iterator.hasNext();) {
					VerticalPanel hp = iterator.next();
					ListBox combo = (ListBox) ((HorizontalPanel) hp
							.getWidget(0)).getWidget(0);
					if (combo.getItemCount() == 0)
						agregarItemsCombo(combo, especies.keySet());
				}
			}
		});

		tipoMatrizProductivaService
				.getElementos(new AsyncCallback<Map<String, TipoMatrizProductiva>>() {
					public void onFailure(Throwable caught) {
						errorLabel
								.setText(Messages.getString("VentanaCarga.errorObtenerTiposMatrizProductiva")); //$NON-NLS-1$
					}

					@Override
					public void onSuccess(
							Map<String, TipoMatrizProductiva> result) {
						tiposMatrizProductiva = result;
						for (Iterator<HorizontalPanel> iterator = widgetsObsMatrizProductiva
								.iterator(); iterator.hasNext();) {
							HorizontalPanel hp = iterator.next();
							ListBox combo = (ListBox) hp.getWidget(0);
							if (combo.getItemCount() == 0)
								agregarItemsCombo(combo,
										tiposMatrizProductiva.keySet());
						}
					}

				});
		ubicacionService
				.getElementos(new AsyncCallback<Map<String, Ubicacion>>() {
					public void onFailure(Throwable caught) {
						errorLabel
								.setText(Messages.getString("VentanaCarga.errorObtenerUbicaciones")); //$NON-NLS-1$
					}

					@Override
					public void onSuccess(Map<String, Ubicacion> result) {
						ubicaciones = result;

						if (laguna.getItemCount() == 0)
							agregarItemsCombo(laguna, ubicaciones.keySet());
					}

				});

		setWidget(0, 1, laguna);

		// Focus the cursor on the name field when the app loads
		laguna.setFocus(true);

		Label lblNewLabel_1 = new Label(Messages.getString("VentanaCarga.fechaYHoras")); //$NON-NLS-1$
		setWidget(1, 0, lblNewLabel_1);
		HorizontalPanel horizontalPanel1 = new HorizontalPanel();
		dateBox = new DateBox();
		dateBox.setWidth("70px");
		setWidget(1, 1, horizontalPanel1);
		dateBox.setFormat(new DefaultFormat(DateTimeFormat
				.getFormat(Messages.getString("VentanaCarga.formatoFechaCorta")))); //$NON-NLS-1$
		dateBox.setValue(new Date());
		horaInicio = new TimeBox();
		horaInicio.setWidth("45px");
		horaInicio.setValue(DateTimeFormat.getFormat(Messages.getString("VentanaCarga.formatoHora")) //$NON-NLS-1$
				.format(new Date()));
		horaFin = new TimeBox();
		horaFin.setWidth("45px");
		horaFin.setValue(DateTimeFormat.getFormat(Messages.getString("VentanaCarga.formatoHora")).format(new Date())); //$NON-NLS-1$

		horizontalPanel1.add(dateBox);
		horizontalPanel1.add(horaInicio);
		horizontalPanel1.add(horaFin);

		Label lblNewLabel_2 = new Label(Messages.getString("VentanaCarga.conteoEspecie")); //$NON-NLS-1$
		setWidget(2, 0, lblNewLabel_2);

		final VerticalPanel verticalPanel_1 = new VerticalPanel();
		setWidget(2, 1, verticalPanel_1);
		agregarObservacionEspecie(verticalPanel_1);

		Button button = new Button(Messages.getString("VentanaCarga.agregar")); //$NON-NLS-1$

		setWidget(2, 2, button);
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

		Label lblNewLabel_3 = new Label(Messages.getString("VentanaCarga.matrizProductiva")); //$NON-NLS-1$
		setWidget(3, 0, lblNewLabel_3);

		final VerticalPanel verticalPanel_2 = new VerticalPanel();
		setWidget(3, 1, verticalPanel_2);
		agregarObservacionMatrizProductiva(verticalPanel_2);

		Button button2 = new Button(Messages.getString("VentanaCarga.agregar")); //$NON-NLS-1$

		setWidget(3, 2, button2);
		button2.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				agregarObservacionMatrizProductiva(verticalPanel_2);
			}
		});

		getCellFormatter().setVerticalAlignment(3, 2,
				HasVerticalAlignment.ALIGN_BOTTOM);
		getCellFormatter().setVerticalAlignment(3, 0,
				HasVerticalAlignment.ALIGN_TOP);

		Label lblNewLabel0 = new Label(Messages.getString("VentanaCarga.clima")); //$NON-NLS-1$
		setWidget(4, 0, lblNewLabel0);
		Grid grid2 = new Grid(2, 4);

		Label lblNewLabel1 = new Label(Messages.getString("VentanaCarga.sol")); //$NON-NLS-1$
		checkSol = new CheckBox();

		grid2.setWidget(0, 0, lblNewLabel1);
		grid2.setWidget(0, 1, checkSol);

		Label lblNewLabel3 = new Label(Messages.getString("VentanaCarga.nubes")); //$NON-NLS-1$

		comboNuves = comboNubes();

		grid2.setWidget(0, 2, lblNewLabel3);
		grid2.setWidget(0, 3, comboNuves);

		Label lblNewLabel2 = new Label(Messages.getString("VentanaCarga.lluvia")); //$NON-NLS-1$
		checkLluvia = new CheckBox();
		grid2.setWidget(1, 0, lblNewLabel2);
		grid2.setWidget(1, 1, checkLluvia);

		Label lblNewLabel4 = new Label(Messages.getString("VentanaCarga.viento")); //$NON-NLS-1$

		comboViento = comboViento();
		grid2.setWidget(1, 2, lblNewLabel4);
		grid2.setWidget(1, 3, comboViento);

		setWidget(4, 1, grid2);

		Label lblNewLabel6 = new Label(Messages.getString("VentanaCarga.observaciones")); //$NON-NLS-1$

		setWidget(5, 0, lblNewLabel6);
		observaciones = new TextArea();

		setWidget(5, 1, observaciones);

		Label lblNewLabel5 = new Label(Messages.getString("VentanaCarga.fotos")); //$NON-NLS-1$

		setWidget(6, 0, lblNewLabel5);

		SingleUploader uploader = new SingleUploader(FileInputType.BUTTON);
		uploader.setI18Constants(new UploaderConstantsImpl());
		uploader.setAutoSubmit(true);
		uploader.setEnabled(true);
		uploader.setAvoidRepeatFiles(true);
		uploader.addOnFinishUploadHandler(onFinishUploaderHandler);
		uploader.setValidExtensions("jpg", "jpeg", "png", "gif");
		setWidget(6, 1, uploader);

		setWidget(7, 1, panelImages);

		final Button sendButton = new Button(Messages.getString("VentanaCarga.enviar")); //$NON-NLS-1$
		sendButton.addStyleName("sendButton");
		sendButton.addClickHandler(new ClickHandler() {

			public void onClick(ClickEvent event) {
				Observacion observacion = getObservacion();
				observacionService.addElemento(observacion,
						new AsyncCallback<Void>() {

							@Override
							public void onFailure(Throwable caught) {
								errorLabel
										.setText(Messages.getString("VentanaCarga.errorGuardarObservacion")); //$NON-NLS-1$

							}

							@Override
							public void onSuccess(Void result) {
								errorLabel.setText(Messages.getString("VentanaCarga.observacionGuardada")); //$NON-NLS-1$

							}
						});
			}
		});
		setWidget(8, 1, sendButton);
	
	}

	private void agregarItemsCombo(final ListBox comboBox, Set<String> list) {
		comboBox.addItem(Messages.getString("VentanaCarga.seleccionar")); //$NON-NLS-1$
		for (Iterator<String> iterator = list.iterator(); iterator.hasNext();) {
			String especie = iterator.next();
			comboBox.addItem(especie);
		}
		comboBox.setItemSelected(0, true);
		comboBox.addItem(Messages.getString("VentanaCarga.otra")); //$NON-NLS-1$
	}
	private void agregarObservacionEspecie(final VerticalPanel verticalPanel_1) {
		VerticalPanel verticalPanel = new VerticalPanel();
		if (widgetsObsEspecie.size() > 0)
			verticalPanel_1.setBorderWidth(1);
		verticalPanel_1.add(verticalPanel);
		HorizontalPanel horizontalPanel = new HorizontalPanel();
		verticalPanel.add(horizontalPanel);

		final ListBox comboBox = generarComboItemsObservables(
				especies.keySet(), new AgregarEspecieDialog());

		horizontalPanel.add(comboBox);

		IntegerBox textBox_1 = new IntegerBox();
		horizontalPanel.add(textBox_1);

		HorizontalPanel horizontalPanel2 = new HorizontalPanel();
		verticalPanel.add(horizontalPanel2);
		ListBox edad = comboEdad();
		horizontalPanel2.add(edad);
		ListBox distancia = comboDistancia();
		horizontalPanel2.add(distancia);

		ListBox conteo = comboConteo();
		horizontalPanel2.add(conteo);

		widgetsObsEspecie.add(verticalPanel);
		textBox_1.setWidth("60px");
	}
	private void agregarObservacionMatrizProductiva(
			final VerticalPanel verticalPanel_1) {
		HorizontalPanel horizontalPanel1 = new HorizontalPanel();
		if (widgetsObsMatrizProductiva.size() > 0)
			verticalPanel_1.setBorderWidth(1);
		verticalPanel_1.add(horizontalPanel1);

		final ListBox comboBox = generarComboItemsObservables(
				tiposMatrizProductiva.keySet(),
				new AgregarTipoMatrizProductivaDialog());

		horizontalPanel1.add(comboBox);

		IntegerBox textBox_1 = new IntegerBox();
		horizontalPanel1.add(textBox_1);
		widgetsObsMatrizProductiva.add(horizontalPanel1);
		textBox_1.setWidth("50px");
		Label l = new Label("%");
		horizontalPanel1.add(l);
	}

	private void borrarImagen(String imagen) {

		archivosService.borrar(imagen, new AsyncCallback<Void>() {
			public void onFailure(Throwable caught) {
				Label errorLabel =(Label) RootPanel.get("errorLabelContainer").getWidget(0);
				errorLabel.setText(Messages.getString("VentanaCarga.errorEliminarArchivo")); //$NON-NLS-1$
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
			ConteoEnum e=ConteoEnum.values()[i];
			conteo.addItem(Messages.getString("ConteoEnum."+e), e.toString());
		}
		return conteo;
	}

	private ListBox comboDistancia() {
		ListBox distancia = new ListBox();
		for (int i = 0; i < DistanciaEnum.values().length; i++) {
			DistanciaEnum e=DistanciaEnum.values()[i];
			distancia.addItem(Messages.getString("DistanciaEnum."+e), e.toString());
		}
		return distancia;
	}

	private ListBox comboEdad() {
		ListBox edad = new ListBox();
		for (int i = 0; i < EdadEnum.values().length; i++) {
			EdadEnum e=EdadEnum.values()[i];
			edad.addItem(Messages.getString("EdadEnum."+e), e.toString());
		}
		edad.setSelectedIndex(2);
		return edad;
	}

	private ListBox comboNubes() {
		ListBox comboNuves = new ListBox();
		for (int i = 0; i < NubesEnum.values().length; i++) {
			NubesEnum ne=NubesEnum.values()[i];
			comboNuves.addItem(Messages.getString("NubesEnum."+ne), ne.toString());
		}
		comboNuves.setSelectedIndex(1);
		return comboNuves;
	}

	private ListBox comboViento() {
		ListBox comboViento = new ListBox();
		for (int i = 0; i < VientoEnum.values().length; i++) {
			VientoEnum ve=VientoEnum.values()[i];
			comboViento.addItem(Messages.getString("VientoEnum."+ve.toString()), ve.toString());
		}
		comboViento.setSelectedIndex(1);
		return comboViento;
	}

	void establecerElementoCombo(ListBox combo, String especie) {
		combo.addItem(especie);
		combo.setSelectedIndex(combo.getItemCount() - 1);
	}

	private ListBox generarComboItemsObservables(Set<String> items,
			final AgregarElementoDialog dlg) {
		final ListBox comboBox = new ListBox();

		comboBox.addChangeHandler(new ChangeHandler() {

			public void onChange(ChangeEvent event) {

				if (comboBox.getItemText(comboBox.getSelectedIndex()).equals(
						Messages.getString("VentanaCarga.otra"))) { //$NON-NLS-1$

					dlg.setCombo(comboBox);
					dlg.center();

				}
			}
		});
		if (!items.isEmpty()) {
			agregarItemsCombo(comboBox, items);
		}
		return comboBox;
	}

	private ObservacionClima getObservacionClima() {
		ObservacionClima oc = new ObservacionClima();
		oc.setLluvia(checkLluvia.getValue());
		oc.setSol(checkSol.getValue());
		oc.setNuves(comboNuves.getValue(comboNuves.getSelectedIndex()));
		oc.setViento(comboViento.getValue(comboViento.getSelectedIndex()));
		return oc;
	}

	private ObservacionEspecie getObservacionEspecie(VerticalPanel vp) {
		ObservacionEspecie oe = new ObservacionEspecie();
		oe.setCantidad(((IntegerBox) ((HorizontalPanel) vp.getWidget(0))
				.getWidget(1)).getValue());
		oe.setIdEspecie(especies
				.get((((ListBox) ((HorizontalPanel) vp.getWidget(0))
						.getWidget(0))
						.getValue(((ListBox) ((HorizontalPanel) vp.getWidget(0))
								.getWidget(0)).getSelectedIndex()))).getId());
		oe.setEdad(((ListBox) ((HorizontalPanel) vp.getWidget(1)).getWidget(0))
				.getValue(((ListBox) ((HorizontalPanel) vp.getWidget(1))
						.getWidget(0)).getSelectedIndex()));
		oe.setConteo(((ListBox) ((HorizontalPanel) vp.getWidget(1))
				.getWidget(1)).getValue(((ListBox) ((HorizontalPanel) vp
				.getWidget(1)).getWidget(1)).getSelectedIndex()));
		oe.setConteo(((ListBox) ((HorizontalPanel) vp.getWidget(1))
				.getWidget(2)).getValue(((ListBox) ((HorizontalPanel) vp
				.getWidget(1)).getWidget(2)).getSelectedIndex()));
		return oe;
	}

	private ObservacionFoto getObservacionFoto(int i) {
		ObservacionFoto observacionFoto = new ObservacionFoto();
		observacionFoto.setNombreArchivo(imagenes.get(i));
		observacionFoto
				.setTipo((((CheckBox) ((VerticalPanel) ((HorizontalPanel) panelImages
						.getWidget(i)).getWidget(1)).getWidget(0)).getValue() == Boolean.TRUE ? TipoFotoEnum.Panoramica.toString()
						: TipoFotoEnum.Normal.toString()));
		return (observacionFoto);
	}

	private ObservacionMatrizProductiva getObservacionMatrizProductiva(
			HorizontalPanel hp) {
		ObservacionMatrizProductiva omp = new ObservacionMatrizProductiva();
		omp.setIdTipoMatrizProductiva(tiposMatrizProductiva.get(
				(((ListBox) hp.getWidget(0)).getValue(((ListBox) hp
						.getWidget(0)).getSelectedIndex()))).getId());
		omp.setPorcentaje(((IntegerBox) hp.getWidget(1)).getValue());
		return omp;
	}

	private Ubicacion getUbicacion() {
		return ubicaciones.get(laguna.getValue(laguna.getSelectedIndex()));
	}

	@SuppressWarnings("deprecation")
	private Observacion getObservacion() {
		Observacion observacion = new Observacion();
		observacion.setObservaciones(observaciones.getValue());
		observacion.setEstado(EstadoEnum.ARevisar.toString());// TODO: asociar al usuario
		observacion.setAlcance(AlcanceEnum.Total.toString());// TODO: poner Combo
		observacion.setFiabilidad(FiabilidadEnum.Fiable.toString());// TODO: asociar al usuario
		observacion.setIdUbicacion(getUbicacion().getId());
		observacion.setObservacionClima(getObservacionClima());

		ObservacionEspecie[] observacionesEspecie = new ObservacionEspecie[widgetsObsEspecie
				.size()];
		for (int i = 0; i < widgetsObsEspecie.size(); i++) {
			observacionesEspecie[i] = getObservacionEspecie(widgetsObsEspecie
					.get(i));
		}
		observacion.setObservacionesEspecie(observacionesEspecie);

		ObservacionMatrizProductiva[] obsMatrizProductiva = new ObservacionMatrizProductiva[widgetsObsMatrizProductiva
				.size()];
		for (int i = 0; i < widgetsObsMatrizProductiva.size(); i++) {
			obsMatrizProductiva[i] = getObservacionMatrizProductiva(widgetsObsMatrizProductiva
					.get(i));
		}
		observacion.setObservacionesMatrizProductiva(obsMatrizProductiva);

		ObservacionFoto[] observacionesFoto = new ObservacionFoto[imagenes
				.size()];
		for (int i = 0; i < imagenes.size(); i++) {
			observacionesFoto[i] = getObservacionFoto(i);
		}
		observacion.setObservacionesFoto(observacionesFoto);

		Date fecha = new Date(dateBox.getValue().getYear(), dateBox.getValue()
				.getMonth(), dateBox.getValue().getDate(), DateTimeFormat
				.getFormat(Messages.getString("VentanaCarga.formatoHora")).parse(horaInicio.getValue()).getHours(), //$NON-NLS-1$
				DateTimeFormat.getFormat(Messages.getString("VentanaCarga.formatoHora")).parse(horaInicio.getValue()) //$NON-NLS-1$
						.getMinutes());
		observacion.setInicio(fecha);
		fecha = new Date(dateBox.getValue().getYear(), dateBox.getValue()
				.getMonth(), dateBox.getValue().getDate(), DateTimeFormat
				.getFormat(Messages.getString("VentanaCarga.formatoHora")).parse(horaFin.getValue()).getHours(), //$NON-NLS-1$
				DateTimeFormat.getFormat(Messages.getString("VentanaCarga.formatoHora")).parse(horaFin.getValue()) //$NON-NLS-1$
						.getMinutes());
		observacion.setFin(fecha);

		return observacion;
	}
}

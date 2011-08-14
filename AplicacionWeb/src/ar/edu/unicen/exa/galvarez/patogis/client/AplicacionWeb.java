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

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionClima;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionEspecie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionFoto;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionMatrizProductiva;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.TipoMatrizProductiva;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Ubicacion;

import com.google.gwt.core.client.EntryPoint;
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

/**
 * Entry point classes define <code>onModuleLoad()</code>.
 */
public class AplicacionWeb implements EntryPoint {

	private FlowPanel panelImages = new FlowPanel();
	private List<String> imagenes = new ArrayList<String>();
	Map<String, Especie> especies = new HashMap<String, Especie>();
	Map<String, Ubicacion> ubicaciones = new HashMap<String, Ubicacion>();
	Map<String, TipoMatrizProductiva> tiposMatrizProductiva = new HashMap<String, TipoMatrizProductiva>();
	final Label errorLabel = new Label();
	final ArchivosServiceAsync archivosService = GWT
			.create(ArchivosService.class);
	final EspeciesServiceAsync especiesService = GWT
			.create(EspeciesService.class);
	final ObservacionServiceAsync observacionService = GWT
			.create(ObservacionService.class);
	final UbicacionServiceAsync ubicacionService = GWT
			.create(UbicacionService.class);
	final TipoMatrizProductivaServiceAsync tipoMatrizProductivaService = GWT
			.create(TipoMatrizProductivaService.class);

	private List<VerticalPanel> conteosEspecie = new ArrayList<VerticalPanel>();
	private List<HorizontalPanel> observacionesMatrizProductiva = new ArrayList<HorizontalPanel>();
	private ListBox laguna;
	private CheckBox checkSol;
	private ListBox comboNuves;
	private CheckBox checkLluvia;
	private ListBox comboViento;
	private DateBox dateBox;
	private TimeBox horaInicio;
	private TimeBox horaFin;
	private TextArea observaciones;

	/**
	 * This is the entry point method.
	 */
	public void onModuleLoad() {

		especiesService.getElementos(new AsyncCallback<Map<String, Especie>>() {
			public void onFailure(Throwable caught) {
				errorLabel.setText("Error al obtener especies del webservice");
			}

			@Override
			public void onSuccess(Map<String, Especie> result) {
				especies = result;
				for (Iterator<VerticalPanel> iterator = conteosEspecie
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
								.setText("Error al obtener tipos de matriz productiva del webservice");
					}

					@Override
					public void onSuccess(
							Map<String, TipoMatrizProductiva> result) {
						tiposMatrizProductiva = result;
						for (Iterator<HorizontalPanel> iterator = observacionesMatrizProductiva
								.iterator(); iterator.hasNext();) {
							HorizontalPanel hp = iterator.next();
							ListBox combo = (ListBox) hp.getWidget(0);
							if (combo.getItemCount() == 0)
								agregarItemsCombo(combo,
										tiposMatrizProductiva.keySet());
						}
					}

				});

		// Add the nameField and sendButton to the RootPanel
		// Use RootPanel.get() to get the entire body element
		RootPanel rootPanel = RootPanel.get("principalContainer");
		RootPanel.get("errorLabelContainer").add(errorLabel);

		Grid grid = new Grid(12, 3);

		rootPanel.add(grid);
		grid.setSize("100px", "100px");

		Label lblNewLabel = new Label("Laguna");
		grid.setWidget(0, 0, lblNewLabel);
		laguna = generarComboItemsObservables(ubicaciones.keySet(),
				new AgregarUbicacionDialog());
		grid.setWidget(0, 1, laguna);

		ubicacionService
				.getElementos(new AsyncCallback<Map<String, Ubicacion>>() {
					public void onFailure(Throwable caught) {
						errorLabel
								.setText("Error al obtener ubicaciones del webservice");
					}

					@Override
					public void onSuccess(Map<String, Ubicacion> result) {
						ubicaciones = result;

						if (laguna.getItemCount() == 0)
							agregarItemsCombo(laguna, ubicaciones.keySet());
					}

				});

		// Focus the cursor on the name field when the app loads
		laguna.setFocus(true);

		Label lblNewLabel_1 = new Label("Fecha y Horas");
		grid.setWidget(1, 0, lblNewLabel_1);
		HorizontalPanel horizontalPanel1 = new HorizontalPanel();
		dateBox = new DateBox();
		dateBox.setWidth("70px");
		grid.setWidget(1, 1, horizontalPanel1);
		dateBox.setFormat(new DefaultFormat(DateTimeFormat
				.getFormat("dd/MM/yy")));
		dateBox.setValue(new Date());
		horaInicio = new TimeBox();
		horaInicio.setWidth("45px");
		horaInicio.setValue(DateTimeFormat.getFormat("HH:mm")
				.format(new Date()));
		horaFin = new TimeBox();
		horaFin.setWidth("45px");
		horaFin.setValue(DateTimeFormat.getFormat("HH:mm").format(new Date()));

		horizontalPanel1.add(dateBox);
		horizontalPanel1.add(horaInicio);
		horizontalPanel1.add(horaFin);

		Label lblNewLabel_2 = new Label("Conteo Especie");
		grid.setWidget(2, 0, lblNewLabel_2);

		final VerticalPanel verticalPanel_1 = new VerticalPanel();
		grid.setWidget(2, 1, verticalPanel_1);
		agregarObservacionConteo(verticalPanel_1);

		Button button = new Button("+");

		grid.setWidget(2, 2, button);
		button.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				agregarObservacionConteo(verticalPanel_1);
			}
		});
		// We can add style names to widgets

		grid.getCellFormatter().setVerticalAlignment(2, 2,
				HasVerticalAlignment.ALIGN_BOTTOM);
		grid.getCellFormatter().setVerticalAlignment(2, 0,
				HasVerticalAlignment.ALIGN_TOP);

		Label lblNewLabel_3 = new Label("Matriz Productiva");
		grid.setWidget(3, 0, lblNewLabel_3);

		final VerticalPanel verticalPanel_2 = new VerticalPanel();
		grid.setWidget(3, 1, verticalPanel_2);
		agregarObservacionMatrizProductiva(verticalPanel_2);

		Button button2 = new Button("+");

		grid.setWidget(3, 2, button2);
		button2.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				agregarObservacionMatrizProductiva(verticalPanel_2);
			}
		});

		grid.getCellFormatter().setVerticalAlignment(3, 2,
				HasVerticalAlignment.ALIGN_BOTTOM);
		grid.getCellFormatter().setVerticalAlignment(3, 0,
				HasVerticalAlignment.ALIGN_TOP);

		Label lblNewLabel0 = new Label("Clima");
		grid.setWidget(4, 0, lblNewLabel0);
		Grid grid2 = new Grid(2, 4);

		Label lblNewLabel1 = new Label("Sol");
		checkSol = new CheckBox();

		grid2.setWidget(0, 0, lblNewLabel1);
		grid2.setWidget(0, 1, checkSol);

		Label lblNewLabel3 = new Label("Nuves");

		comboNuves = comboClima();

		grid2.setWidget(0, 2, lblNewLabel3);
		grid2.setWidget(0, 3, comboNuves);

		Label lblNewLabel2 = new Label("Lluvia");
		checkLluvia = new CheckBox();
		grid2.setWidget(1, 0, lblNewLabel2);
		grid2.setWidget(1, 1, checkLluvia);

		Label lblNewLabel4 = new Label("Viento");

		comboViento = comboClima();
		grid2.setWidget(1, 2, lblNewLabel4);
		grid2.setWidget(1, 3, comboViento);

		grid.setWidget(4, 1, grid2);

		Label lblNewLabel6 = new Label("Observacioens");

		grid.setWidget(5, 0, lblNewLabel6);
		observaciones = new TextArea();

		grid.setWidget(5, 1, observaciones);

		Label lblNewLabel5 = new Label("Fotos");

		grid.setWidget(6, 0, lblNewLabel5);

		SingleUploader uploader = new SingleUploader(FileInputType.BUTTON);
		uploader.setI18Constants(new UploaderConstantsImpl());
		uploader.setAutoSubmit(true);
		uploader.setEnabled(true);
		uploader.setAvoidRepeatFiles(true);
		uploader.addOnFinishUploadHandler(onFinishUploaderHandler);
		uploader.setValidExtensions("jpg", "jpeg", "png", "gif");
		grid.setWidget(6, 1, uploader);

		grid.setWidget(7, 1, panelImages);

		final Button sendButton = new Button("Enviar");
		sendButton.addStyleName("sendButton");
		sendButton.addClickHandler(new ClickHandler() {

			public void onClick(ClickEvent event) {
				Observacion observacion = obtenerObservacion();
				observacionService.addElemento(observacion,
						new AsyncCallback<Void>() {

							@Override
							public void onSuccess(Void result) {
								errorLabel.setText("Observacion guardada");

							}

							@Override
							public void onFailure(Throwable caught) {
								errorLabel
										.setText("Error al guardar observacion");

							}
						});
			}
		});
		grid.setWidget(8, 1, sendButton);

	}

	private ObservacionClima getObservacionClima() {
		ObservacionClima oc = new ObservacionClima();
		oc.setLluvia(checkLluvia.getValue());
		oc.setSol(checkSol.getValue());
		oc.setNuves(comboNuves.getValue(comboNuves.getSelectedIndex()));
		oc.setViento(comboViento.getValue(comboViento.getSelectedIndex()));
		return oc;
	}

	private Ubicacion getUbicacion() {
		return ubicaciones.get(laguna.getValue(laguna.getSelectedIndex()));
	}

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

	// Attach an image to the pictures viewer
	private OnLoadPreloadedImageHandler showImage = new OnLoadPreloadedImageHandler() {
		public void onLoad(PreloadedImage image) {
			image.setWidth("75px");
			final HorizontalPanel hp = new HorizontalPanel();
			hp.add(image);
			VerticalPanel vp = new VerticalPanel();

			CheckBox cb = new CheckBox();
			cb.setText("Panoramica");
			vp.add(cb);
			Button borrar = new Button("X");
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

	private void borrarImagen(String imagen) {

		archivosService.borrar(imagen, new AsyncCallback<Void>() {
			public void onFailure(Throwable caught) {
				errorLabel.setText("Error al  eliminar archivo");
			}

			@Override
			public void onSuccess(Void result) {
				// nada

			}
		});
	}

	private ListBox comboClima() {
		final ListBox comboNuves = new ListBox();
		comboNuves.addItem("Normal -", "0");
		comboNuves.addItem("Normal", "1");
		comboNuves.addItem("Normal +", "2");
		comboNuves.setSelectedIndex(1);
		return comboNuves;
	}

	private void agregarObservacionMatrizProductiva(
			final VerticalPanel verticalPanel_1) {
		HorizontalPanel horizontalPanel1 = new HorizontalPanel();
		if (observacionesMatrizProductiva.size() > 0)
			verticalPanel_1.setBorderWidth(1);
		verticalPanel_1.add(horizontalPanel1);

		final ListBox comboBox = generarComboItemsObservables(
				tiposMatrizProductiva.keySet(),
				new AgregarTipoMatrizProductivaDialog());

		horizontalPanel1.add(comboBox);

		IntegerBox textBox_1 = new IntegerBox();
		horizontalPanel1.add(textBox_1);
		observacionesMatrizProductiva.add(horizontalPanel1);
		textBox_1.setWidth("50px");
		Label l = new Label("%");
		horizontalPanel1.add(l);
	}

	private void agregarObservacionConteo(final VerticalPanel verticalPanel_1) {
		VerticalPanel verticalPanel = new VerticalPanel();
		if (conteosEspecie.size() > 0)
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
		ListBox edad = new ListBox();
		edad.addItem("Pichon", "0");
		edad.addItem("Juvenil", "1");
		edad.addItem("Adulto", "2");
		edad.setSelectedIndex(2);
		horizontalPanel2.add(edad);

		ListBox distancia = new ListBox();
		distancia.addItem("Cerca", "0");
		distancia.addItem("Lejos", "1");
		edad.setSelectedIndex(0);
		horizontalPanel2.add(distancia);

		ListBox conteo = new ListBox();
		conteo.addItem("Estimado", "0");
		conteo.addItem("Preciso", "1");
		edad.setSelectedIndex(0);
		horizontalPanel2.add(conteo);

		conteosEspecie.add(verticalPanel);
		textBox_1.setWidth("60px");
	}

	private ListBox generarComboItemsObservables(Set<String> items,
			final AgregarElementoObservableDialog dlg) {
		final ListBox comboBox = new ListBox();

		comboBox.addChangeHandler(new ChangeHandler() {

			public void onChange(ChangeEvent event) {

				if (comboBox.getItemText(comboBox.getSelectedIndex()).equals(
						"Otra...")) {

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

	private void agregarItemsCombo(final ListBox comboBox, Set<String> list) {
		comboBox.addItem("Seleccionar");
		for (Iterator<String> iterator = list.iterator(); iterator.hasNext();) {
			String especie = iterator.next();
			comboBox.addItem(especie);
		}
		comboBox.setItemSelected(0, true);
		comboBox.addItem("Otra...");
	}

	void establecerElementoCombo(ListBox combo, String especie) {
		combo.addItem(especie);
		combo.setSelectedIndex(combo.getItemCount() - 1);
	}

	@SuppressWarnings("deprecation")
	private Observacion obtenerObservacion() {
		Observacion observacion = new Observacion();
		observacion.setObservaciones(observaciones.getValue());
		observacion.setEstado("A Revisar");
		observacion.setAlcance("");
		observacion.setIdUbicacion(getUbicacion().getId());
		observacion.setObservacionClima(getObservacionClima());

		for (VerticalPanel vp : conteosEspecie) {
			observacion.addObservacionEspecie(getObservacionEspecie(vp));
		}

		for (HorizontalPanel hp : observacionesMatrizProductiva) {
			observacion
					.addObservacionMatrizProductiva(getObservacionMatrizProductiva(hp));
		}

		for (int i = 0; i < imagenes.size(); i++) {
			observacion.addObservacionFoto(getObservacionFoto(i));

		}

		Date fecha = new Date(dateBox.getValue().getYear(), dateBox.getValue()
				.getMonth(), dateBox.getValue().getDate(), DateTimeFormat
				.getFormat("HH:mm").parse(horaInicio.getValue()).getHours(),
				DateTimeFormat.getFormat("HH:mm").parse(horaInicio.getValue())
						.getMinutes());
		observacion.setInicio(fecha);
		fecha = new Date(dateBox.getValue().getYear(), dateBox.getValue()
				.getMonth(), dateBox.getValue().getDate(), DateTimeFormat
				.getFormat("HH:mm").parse(horaFin.getValue()).getHours(),
				DateTimeFormat.getFormat("HH:mm").parse(horaFin.getValue())
						.getMinutes());
		observacion.setFin(fecha);

		return observacion;
	}

	private ObservacionFoto getObservacionFoto(int i) {
		ObservacionFoto observacionFoto = new ObservacionFoto();
		observacionFoto.setNombreArchivo(imagenes.get(i));
		observacionFoto.setTipo((((CheckBox)((HorizontalPanel)panelImages.getWidget(i)).getWidget(1)).getValue()==Boolean.TRUE?"Panoramica":"Normal"));
		return(observacionFoto);
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

	private ObservacionMatrizProductiva getObservacionMatrizProductiva(
			HorizontalPanel hp) {
		ObservacionMatrizProductiva omp = new ObservacionMatrizProductiva();
		omp.setIdTipoMatrizProductiva(tiposMatrizProductiva.get(
				(((ListBox) hp.getWidget(0)).getValue(((ListBox) hp
						.getWidget(0)).getSelectedIndex()))).getId());
		omp.setPorcentaje(((IntegerBox) hp.getWidget(1)).getValue());
		return omp;
	}

	class AgregarEspecieDialog extends AgregarElementoObservableDialog {

		public AgregarEspecieDialog() {

			setText("Ingresar Nueva Especie");
		}

		protected void grabar() {
			Especie e = new Especie();
			e.setNombre(text.getValue());
			especiesService.addElemento(e, new AsyncCallback<Void>() {
				public void onFailure(Throwable caught) {
					errorLabel
							.setText("Error al guardar nueva especie via webService");
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

	class AgregarTipoMatrizProductivaDialog extends
			AgregarElementoObservableDialog {

		public AgregarTipoMatrizProductivaDialog() {

			setText("Ingresar Nuevo Tipo de Matriz Productiva");
		}

		protected void grabar() {
			TipoMatrizProductiva tmp = new TipoMatrizProductiva();
			tmp.setNombre(text.getValue());
			tipoMatrizProductivaService.addElemento(tmp,
					new AsyncCallback<Void>() {
						public void onFailure(Throwable caught) {
							errorLabel
									.setText("Error al guardar nuevo tipo de matriz productiva via webService");
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

	class AgregarUbicacionDialog extends AgregarElementoObservableDialog {

		public AgregarUbicacionDialog() {

			setText("Ingresar Nombre Nueva Ubicación");
		}

		protected void grabar() {
			Ubicacion u = new Ubicacion();
			u.setNombre(text.getValue());
			ubicacionService.addElemento(u, new AsyncCallback<Void>() {
				public void onFailure(Throwable caught) {
					errorLabel
							.setText("Error al guardar nueva ubicación via webService");
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
}
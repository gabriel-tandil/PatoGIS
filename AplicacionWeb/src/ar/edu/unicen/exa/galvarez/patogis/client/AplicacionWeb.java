package ar.edu.unicen.exa.galvarez.patogis.client;

import gwtupload.client.IFileInput.FileInputType;
import gwtupload.client.IUploadStatus.Status;
import gwtupload.client.IUploader;
import gwtupload.client.IUploader.UploadedInfo;
import gwtupload.client.IUploader.UploaderConstants;
import gwtupload.client.PreloadedImage;
import gwtupload.client.PreloadedImage.OnLoadPreloadedImageHandler;
import gwtupload.client.SingleUploader;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import ar.edu.unicen.exa.galvarez.patogis.shared.FieldVerifier;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ChangeEvent;
import com.google.gwt.event.dom.client.ChangeHandler;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.event.dom.client.KeyCodes;
import com.google.gwt.event.dom.client.KeyUpEvent;
import com.google.gwt.event.dom.client.KeyUpHandler;
import com.google.gwt.i18n.client.DateTimeFormat;
import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.DeferredCommand;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.CheckBox;
import com.google.gwt.user.client.ui.DialogBox;
import com.google.gwt.user.client.ui.DockPanel;
import com.google.gwt.user.client.ui.FlowPanel;
import com.google.gwt.user.client.ui.Grid;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.HasHorizontalAlignment;
import com.google.gwt.user.client.ui.HasVerticalAlignment;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.ListBox;
import com.google.gwt.user.client.ui.RootPanel;
import com.google.gwt.user.client.ui.TextArea;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.VerticalPanel;
import com.google.gwt.user.datepicker.client.DateBox;
import com.google.gwt.user.datepicker.client.DateBox.DefaultFormat;

/**
 * Entry point classes define <code>onModuleLoad()</code>.
 */
public class AplicacionWeb implements EntryPoint {
	/**
	 * The message displayed to the user when the server cannot be reached or
	 * returns an error.
	 */
	private static final String SERVER_ERROR = "An error occurred while "
			+ "attempting to contact the server. Please check your network "
			+ "connection and try again.";

	/**
	 * Create a remote service proxy to talk to the server-side Greeting
	 * service.
	 */
	private final GreetingServiceAsync greetingService = GWT
			.create(GreetingService.class);
	private FlowPanel panelImages = new FlowPanel();
	private List<String> imagenes = new ArrayList<String>();
	private List<String> especies;
	private List<String> ubicaciones;
	private List<String> tiposMatrizProductiva;
	private final EspeciesServiceAsync especiesService = GWT
			.create(EspeciesService.class);
	private final UbicacionServiceAsync ubicacionService = GWT
			.create(UbicacionService.class);
	private final TipoMatrizProductivaServiceAsync tipoMatrizProductivaService = GWT
			.create(TipoMatrizProductivaService.class);

	private List<VerticalPanel> conteosEspecie = new ArrayList<VerticalPanel>();
	private List<HorizontalPanel> observacionesMatrizProductiva = new ArrayList<HorizontalPanel>();

	/**
	 * This is the entry point method.
	 */
	public void onModuleLoad() {
		final Label errorLabel = new Label();

		especiesService.getElementos(new AsyncCallback<List<String>>() {
			public void onFailure(Throwable caught) {
				errorLabel.setText("Error al obtener especies del webservice");
			}

			@Override
			public void onSuccess(List<String> result) {
				especies = result;
				for (Iterator<VerticalPanel> iterator = conteosEspecie
						.iterator(); iterator.hasNext();) {
					VerticalPanel hp = iterator.next();
					ListBox combo = (ListBox) ((HorizontalPanel) hp
							.getWidget(0)).getWidget(0);
					if (combo.getItemCount() == 0)
						agregarItemsCombo(combo, especies);
				}
			}
		});

		tipoMatrizProductivaService
				.getElementos(new AsyncCallback<List<String>>() {
					public void onFailure(Throwable caught) {
						errorLabel
								.setText("Error al obtener tipos de matriz productiva del webservice");
					}

					@Override
					public void onSuccess(List<String> result) {
						tiposMatrizProductiva = result;
						for (Iterator<HorizontalPanel> iterator = observacionesMatrizProductiva
								.iterator(); iterator.hasNext();) {
							HorizontalPanel hp = iterator.next();
							ListBox combo = (ListBox) hp.getWidget(0);
							if (combo.getItemCount() == 0)
								agregarItemsCombo(combo, tiposMatrizProductiva);
						}
					}
				});

		// Add the nameField and sendButton to the RootPanel
		// Use RootPanel.get() to get the entire body element
		RootPanel rootPanel = RootPanel.get("principalContainer");
		RootPanel.get("errorLabelContainer").add(errorLabel);

		Grid grid = new Grid(12, 3);
		// grid.getElement().getStyle().setPosition(Position.RELATIVE);

		rootPanel.add(grid);
		grid.setSize("100px", "100px");

		Label lblNewLabel = new Label("Laguna");
		grid.setWidget(0, 0, lblNewLabel);
		final ListBox laguna = generarComboItemsObservables(ubicaciones,
				new AgregarUbicacionDialog());
		grid.setWidget(0, 1, laguna);

		ubicacionService.getElementos(new AsyncCallback<List<String>>() {
			public void onFailure(Throwable caught) {
				errorLabel
						.setText("Error al obtener ubicaciones del webservice");
			}

			@Override
			public void onSuccess(List<String> result) {
				ubicaciones = result;

				if (laguna.getItemCount() == 0)
					agregarItemsCombo(laguna, ubicaciones);
			}

		});

		// final TextBox nameField = new TextBox();
		// grid.setWidget(0, 1, nameField);
		// nameField.setText("GWT User");

		// Focus the cursor on the name field when the app loads
		laguna.setFocus(true);

		Label lblNewLabel_1 = new Label("Fecha y Horas");
		grid.setWidget(1, 0, lblNewLabel_1);
		HorizontalPanel horizontalPanel1 = new HorizontalPanel();
		DateBox dateBox = new DateBox();
		dateBox.setWidth("70px");
		grid.setWidget(1, 1, horizontalPanel1);
		dateBox.setFormat(new DefaultFormat(DateTimeFormat
				.getFormat("dd/MM/yy")));
		dateBox.setValue(new Date());
		TimeBox horaInicio = new TimeBox();
		horaInicio.setWidth("45px");
		horaInicio.setValue(DateTimeFormat.getFormat("HH:mm")
				.format(new Date()));
		TimeBox horaFin = new TimeBox();
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
		// We can add style names to widgets

		grid.getCellFormatter().setVerticalAlignment(3, 2,
				HasVerticalAlignment.ALIGN_BOTTOM);
		grid.getCellFormatter().setVerticalAlignment(3, 0,
				HasVerticalAlignment.ALIGN_TOP);

		Label lblNewLabel0 = new Label("Clima");
		grid.setWidget(4, 0, lblNewLabel0);
		Grid grid2 = new Grid(2, 4);

		Label lblNewLabel1 = new Label("Sol");
		final CheckBox checkSol = new CheckBox();

		grid2.setWidget(0, 0, lblNewLabel1);
		grid2.setWidget(0, 1, checkSol);

		Label lblNewLabel3 = new Label("Nuves");

		final ListBox comboNuves = comboClima();

		grid2.setWidget(0, 2, lblNewLabel3);
		grid2.setWidget(0, 3, comboNuves);

		Label lblNewLabel2 = new Label("Lluvia");
		final CheckBox checkLluvia = new CheckBox();
		grid2.setWidget(1, 0, lblNewLabel2);
		grid2.setWidget(1, 1, checkLluvia);

		Label lblNewLabel4 = new Label("Viento");

		final ListBox comboViento = comboClima();
		grid2.setWidget(1, 2, lblNewLabel4);
		grid2.setWidget(1, 3, comboViento);

		grid.setWidget(4, 1, grid2);

		Label lblNewLabel6 = new Label("Observacioens");

		grid.setWidget(5, 0, lblNewLabel6);
		final TextArea observaciones = new TextArea();
		// Attach the image viewer to the document
		grid.setWidget(5, 1, observaciones);

		Label lblNewLabel5 = new Label("Fotos");

		grid.setWidget(6, 0, lblNewLabel5);

		// Create a new uploader panel and attach it to the document

		SingleUploader uploader = new SingleUploader(FileInputType.BUTTON);
		uploader.setI18Constants(new uploaderConstants());
		uploader.setAutoSubmit(true);
		uploader.setEnabled(true);
		uploader.setAvoidRepeatFiles(true);
		uploader.addOnFinishUploadHandler(onFinishUploaderHandler);
		uploader.setValidExtensions("jpg", "jpeg", "png", "gif");
		grid.setWidget(6, 1, uploader);
		// Attach the image viewer to the document
		grid.setWidget(7, 1, panelImages);

		final Button sendButton = new Button("Enviar");
		sendButton.addStyleName("sendButton");
		grid.setWidget(8, 1, sendButton);

		// nameField.selectAll();

		// Create the popup dialog box
		final DialogBox dialogBox = new DialogBox();
		dialogBox.setText("Remote Procedure Call");
		dialogBox.setAnimationEnabled(true);
		final Button closeButton = new Button("Close");
		// We can set the id of a widget by accessing its Element
		closeButton.getElement().setId("closeButton");
		final Label textToServerLabel = new Label();
		final HTML serverResponseLabel = new HTML();
		VerticalPanel dialogVPanel = new VerticalPanel();
		dialogVPanel.addStyleName("dialogVPanel");
		dialogVPanel.add(new HTML("<b>Sending name to the server:</b>"));
		dialogVPanel.add(textToServerLabel);
		dialogVPanel.add(new HTML("<br><b>Server replies:</b>"));
		dialogVPanel.add(serverResponseLabel);
		dialogVPanel.setHorizontalAlignment(VerticalPanel.ALIGN_RIGHT);
		dialogVPanel.add(closeButton);
		dialogBox.setWidget(dialogVPanel);

		// Add a handler to close the DialogBox
		closeButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				dialogBox.hide();
				sendButton.setEnabled(true);
				sendButton.setFocus(true);
			}
		});
		// Create a handler for the sendButton and nameField
		class MyHandler implements ClickHandler, KeyUpHandler {
			/**
			 * Fired when the user clicks on the sendButton.
			 */
			public void onClick(ClickEvent event) {
				sendNameToServer();
			}

			/**
			 * Fired when the user types in the nameField.
			 */
			public void onKeyUp(KeyUpEvent event) {
				if (event.getNativeKeyCode() == KeyCodes.KEY_ENTER) {
					sendNameToServer();
				}
			}

			/**
			 * Send the name from the nameField to the server and wait for a
			 * response.
			 */
			private void sendNameToServer() {
				// First, we validate the input.
				errorLabel.setText("");
				String textToServer = observaciones.getText();
				if (!FieldVerifier.isValidName(textToServer)) {
					errorLabel.setText("Please enter at least four characters");
					return;
				}

				// Then, we send the input to the server.
				sendButton.setEnabled(false);
				textToServerLabel.setText(textToServer);
				serverResponseLabel.setText("");
				greetingService.greetServer(textToServer,
						new AsyncCallback<String>() {
							public void onFailure(Throwable caught) {
								// Show the RPC error message to the user
								dialogBox
										.setText("Remote Procedure Call - Failure");
								serverResponseLabel
										.addStyleName("serverResponseLabelError");
								serverResponseLabel.setHTML(SERVER_ERROR);
								dialogBox.center();
								closeButton.setFocus(true);
							}

							public void onSuccess(String result) {
								dialogBox.setText("Remote Procedure Call");
								serverResponseLabel
										.removeStyleName("serverResponseLabelError");
								serverResponseLabel.setHTML(result);
								dialogBox.center();
								closeButton.setFocus(true);
							}
						});
			}
		}

		// Add a handler to send the name to the server
		// MyHandler handler = new MyHandler();
		//
		// sendButton.addClickHandler(handler);
		//
		// nameField.selectAll();
		//
		// nameField.addKeyUpHandler(handler);
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
			HorizontalPanel hp = new HorizontalPanel();
			hp.add(image);
			VerticalPanel vp = new VerticalPanel();

			CheckBox cb = new CheckBox();
			cb.setText("Panoramica");
			vp.add(cb);
			Button borrar = new Button("X");
			vp.add(borrar);
			hp.add(vp);
			panelImages.add(hp);
		}
	};

	private ListBox comboClima() {
		final ListBox comboNuves = new ListBox();
		comboNuves.addItem("Normal -", "0");
		comboNuves.addItem("Normal", "1");
		comboNuves.addItem("Normal +", "2");
		comboNuves.setSelectedIndex(1);
		return comboNuves;
	}

	abstract class AgregarElementoObservableDialog extends DialogBox {

		protected ListBox combo;

		public ListBox getCombo() {
			return combo;
		}

		public void setCombo(ListBox combo) {
			this.combo = combo;
		}

		TextBox text = null;
		Label errorLabel = null;

		@SuppressWarnings("deprecation")
		// sino no anda el setfocus
		public AgregarElementoObservableDialog() {
			Button aceptarButton = new Button("Aceptar");
			Button closeButton = new Button("Cancelar");
			closeButton.addClickHandler(new ClickHandler() {

				@Override
				public void onClick(ClickEvent event) {

					cerrar();

				}
			});
			aceptarButton.addClickHandler(new ClickHandler() {

				@Override
				public void onClick(ClickEvent event) {
					grabar();

				}
			});
			HorizontalPanel botones = new HorizontalPanel();
			botones.add(closeButton);
			botones.add(aceptarButton);
			Label label = new Label("Nombre");
			errorLabel = new Label();
			text = new TextBox();

			DockPanel dock = new DockPanel();
			dock.setSpacing(4);

			dock.add(botones, DockPanel.SOUTH);
			dock.add(errorLabel, DockPanel.NORTH);
			dock.add(label, DockPanel.WEST);
			dock.add(text, DockPanel.CENTER);

			botones.setHorizontalAlignment(HasHorizontalAlignment.ALIGN_RIGHT);
			dock.setWidth("100%");
			setWidget(dock);
			DeferredCommand.addCommand(new Command() {
				public void execute() {
					text.setFocus(true);
				}
			});

		}

		protected abstract void grabar();

		public void cerrar() {
			combo.setSelectedIndex(0);
			hide();
		}

	}

	class uploaderConstants implements UploaderConstants {

		@Override
		public String uploadLabelCancel() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public String uploadStatusCanceled() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public String uploadStatusCanceling() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public String uploadStatusDeleted() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public String uploadStatusError() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public String uploadStatusInProgress() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public String uploadStatusQueued() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public String uploadStatusSubmitting() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public String uploadStatusSuccess() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public String uploaderActiveUpload() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public String uploaderAlreadyDone() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public String uploaderBlobstoreError() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public String uploaderBrowse() {
			// TODO Auto-generated method stub
			return "Agregar...";
		}

		@Override
		public String uploaderInvalidExtension() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public String uploaderSend() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public String uploaderServerError() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public String submitError() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public String uploaderServerUnavailable() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public String uploaderTimeout() {
			// TODO Auto-generated method stub
			return null;
		}

	}

	class AgregarEspecieDialog extends AgregarElementoObservableDialog {

		public AgregarEspecieDialog() {
			setText("Ingresar Nueva Especie");
		}

		protected void grabar() {
			especiesService.addElemento(text.getValue(),
					new AsyncCallback<Void>() {
						public void onFailure(Throwable caught) {
							errorLabel
									.setText("Error al guardar nueva especie via webService");
						}

						@Override
						public void onSuccess(Void result) {
							// nada

						}
					});
			especies.add(text.getValue());
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
			tipoMatrizProductivaService.addElemento(text.getValue(),
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
			tiposMatrizProductiva.add(text.getValue());
			establecerElementoCombo(combo, text.getValue());
			hide();
		}

	}

	class AgregarUbicacionDialog extends AgregarElementoObservableDialog {

		public AgregarUbicacionDialog() {
			setText("Ingresar Nombre Nueva Ubicación");
		}

		protected void grabar() {
			ubicacionService.addElemento(text.getValue(),
					new AsyncCallback<Void>() {
						public void onFailure(Throwable caught) {
							errorLabel
									.setText("Error al guardar nueva ubicación via webService");
						}

						@Override
						public void onSuccess(Void result) {
							// nada

						}
					});
			ubicaciones.add(text.getValue());
			establecerElementoCombo(combo, text.getValue());
			hide();
		}

	}

	private void agregarObservacionMatrizProductiva(
			final VerticalPanel verticalPanel_1) {
		HorizontalPanel horizontalPanel1 = new HorizontalPanel();
		if (observacionesMatrizProductiva.size() > 0)
			verticalPanel_1.setBorderWidth(1);
		verticalPanel_1.add(horizontalPanel1);

		final ListBox comboBox = generarComboItemsObservables(
				tiposMatrizProductiva, new AgregarTipoMatrizProductivaDialog());

		horizontalPanel1.add(comboBox);

		TextBox textBox_1 = new TextBox();
		horizontalPanel1.add(textBox_1);
		observacionesMatrizProductiva.add(horizontalPanel1);
		textBox_1.setWidth("50px");
		Label l = new Label("%");
		horizontalPanel1.add(l);
		// horizontalPanel1.setVerticalAlignment(HasVerticalAlignment.ALIGN_BOTTOM);
	}

	private void agregarObservacionConteo(final VerticalPanel verticalPanel_1) {
		VerticalPanel verticalPanel = new VerticalPanel();
		if (conteosEspecie.size() > 0)
			verticalPanel_1.setBorderWidth(1);
		verticalPanel_1.add(verticalPanel);
		HorizontalPanel horizontalPanel = new HorizontalPanel();
		verticalPanel.add(horizontalPanel);

		final ListBox comboBox = generarComboItemsObservables(especies,
				new AgregarEspecieDialog());

		horizontalPanel.add(comboBox);

		TextBox textBox_1 = new TextBox();
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

	private ListBox generarComboItemsObservables(List<String> items,
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
		if (items != null) {
			agregarItemsCombo(comboBox, items);
		}
		return comboBox;
	}

	private void agregarItemsCombo(final ListBox comboBox, List<String> list) {
		comboBox.addItem("Seleccionar");
		for (Iterator<String> iterator = list.iterator(); iterator.hasNext();) {
			String especie = iterator.next();
			comboBox.addItem(especie);
		}
		comboBox.setItemSelected(0, true);
		comboBox.addItem("Otra...");
	}

	private void establecerElementoCombo(ListBox combo, String especie) {
		combo.addItem(especie);
		combo.setSelectedIndex(combo.getItemCount() - 1);
	}
}
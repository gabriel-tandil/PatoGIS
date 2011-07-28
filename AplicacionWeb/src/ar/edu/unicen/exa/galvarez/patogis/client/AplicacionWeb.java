package ar.edu.unicen.exa.galvarez.patogis.client;

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
import com.google.gwt.user.client.ui.DialogBox;
import com.google.gwt.user.client.ui.DockPanel;
import com.google.gwt.user.client.ui.Grid;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.HasHorizontalAlignment;
import com.google.gwt.user.client.ui.HasVerticalAlignment;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.ListBox;
import com.google.gwt.user.client.ui.RootPanel;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.VerticalPanel;
import com.google.gwt.user.datepicker.client.DateBox;
import com.google.gwt.user.datepicker.client.DateBox.DefaultFormat;
import com.ibm.icu.text.SimpleDateFormat;

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

	private List<String> especies;
	private List<String> tiposMatrizProductiva;
	private final EspeciesServiceAsync especiesService = GWT
			.create(EspeciesService.class);
	private final TipoMatrizProductivaServiceAsync tipoMatrizProductivaService = GWT
			.create(TipoMatrizProductivaService.class);

	private List<HorizontalPanel> conteosEspecie = new ArrayList<HorizontalPanel>();
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
				for (Iterator<HorizontalPanel> iterator = conteosEspecie
						.iterator(); iterator.hasNext();) {
					HorizontalPanel hp = iterator.next();
					ListBox combo = (ListBox) hp.getWidget(0);
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

		Grid grid = new Grid(6, 3);
		// grid.getElement().getStyle().setPosition(Position.RELATIVE);

		rootPanel.add(grid);
		grid.setSize("100px", "100px");

		Label lblNewLabel = new Label("New label");
		grid.setWidget(0, 0, lblNewLabel);
		final TextBox nameField = new TextBox();
		grid.setWidget(0, 1, nameField);
		nameField.setText("GWT User");

		// Focus the cursor on the name field when the app loads
		nameField.setFocus(true);

		Label lblNewLabel_1 = new Label("Fecha y Horas");
		grid.setWidget(1, 0, lblNewLabel_1);
		HorizontalPanel horizontalPanel1 = new HorizontalPanel();
		DateBox dateBox = new DateBox();
		dateBox.setWidth("70px");
		grid.setWidget(1, 1, horizontalPanel1);
		dateBox.setFormat(new DefaultFormat(DateTimeFormat
				.getFormat("dd/MM/yy")));
		dateBox.setValue(new Date());
TimeBox horaInicio=new TimeBox();
horaInicio.setWidth("45px");
horaInicio.setValue(DateTimeFormat
		.getFormat("HH:mm").format(new Date()));
TimeBox horaFin=new TimeBox();
horaFin.setWidth("45px");
horaFin.setValue(DateTimeFormat
		.getFormat("HH:mm").format(new Date()));


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
		final Button sendButton = new Button("Enviar");
		sendButton.addStyleName("sendButton");		
		grid.setWidget(4, 1, sendButton);



		nameField.selectAll();

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
				String textToServer = nameField.getText();
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
		MyHandler handler = new MyHandler();

		sendButton.addClickHandler(handler);

		nameField.selectAll();

		nameField.addKeyUpHandler(handler);
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
									.setText("Error al guardar Nuevo Tipo de Matriz Productiva especie via webService");
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

	private void agregarObservacionMatrizProductiva(
			final VerticalPanel verticalPanel_1) {
		HorizontalPanel horizontalPanel1 = new HorizontalPanel();
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
	//	horizontalPanel1.setVerticalAlignment(HasVerticalAlignment.ALIGN_BOTTOM);
	}

	private void agregarObservacionConteo(final VerticalPanel verticalPanel_1) {
		HorizontalPanel horizontalPanel = new HorizontalPanel();
		verticalPanel_1.add(horizontalPanel);

		final ListBox comboBox = generarComboItemsObservables(especies,
				new AgregarEspecieDialog());

		horizontalPanel.add(comboBox);

		TextBox textBox_1 = new TextBox();
		horizontalPanel.add(textBox_1);
		conteosEspecie.add(horizontalPanel);
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
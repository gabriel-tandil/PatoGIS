package ar.edu.unicen.exa.galvarez.patogis.client;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Usuario;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.event.logical.shared.CloseEvent;
import com.google.gwt.event.logical.shared.CloseHandler;
import com.google.gwt.event.logical.shared.OpenEvent;
import com.google.gwt.event.logical.shared.OpenHandler;
import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.Timer;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.DisclosurePanel;
import com.google.gwt.user.client.ui.DockPanel;
import com.google.gwt.user.client.ui.Grid;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.HasHorizontalAlignment;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.MenuBar;
import com.google.gwt.user.client.ui.MenuItem;
import com.google.gwt.user.client.ui.PasswordTextBox;
import com.google.gwt.user.client.ui.PopupPanel;
import com.google.gwt.user.client.ui.RootPanel;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.Widget;

/**
 * Entry point classes define <code>onModuleLoad()</code>.
 */
public class AplicacionWeb implements EntryPoint {
	static AplicacionWebConstantes constantes = GWT
			.create(AplicacionWebConstantes.class);
	public static Configuracion configuracion = new Configuracion();
	public static PopupPanel alertaPopup = new PopupPanel();
	private static String mensajeActual;
	private MenuItem labelUsuario;
	private MenuItem persistirLocales;
	public static Contexto contexto = new Contexto();
	final static DisclosurePanel dp = new DisclosurePanel(constantes.menu());;
	final UsuariosServiceAsync usuariosService = GWT
			.create(UsuariosService.class);
	private static Timer t = new Timer() {
		public void run() {
			alertaPopup.hide();
		}

	};

	public static void setMensajeAlerta(String mensaje) {
		if (alertaPopup.isShowing()) {
			mensajeActual += "<p>" + mensaje + "</p>";
			alertaPopup.setWidget(new HTML(mensajeActual));
		} else {
			mensajeActual = "<p>" + mensaje + "</p>";
			alertaPopup.setWidget(new HTML(mensajeActual));
			alertaPopup
					.setPopupPositionAndShow(new PopupPanel.PositionCallback() {
						public void setPosition(int offsetWidth,
								int offsetHeight) {
							int left = ((Window.getClientWidth() - offsetWidth) / 2) >> 0;
							int top = ((Window.getClientHeight() - offsetHeight) / 2) >> 0;
							alertaPopup.setPopupPosition(left, top);
						}
					});
		}
		t.schedule(7000);
	}

	Command loginCommand = new Command() {
		public void execute() {
			contexto.setUsuarioLogueado(null);
			persistirLocales.setEnabled(false);
			labelUsuario.setText("l:");
			final DialogBoxExtendido dialogo = new DialogBoxExtendido();
			dialogo.setAnimationEnabled(true);
			dialogo.setText(constantes.login());
			Button aceptarButton = new Button(constantes.loginBoton());
			Button closeButton = new Button("Cancelar");
			closeButton.addClickHandler(new ClickHandler() {
				
				@Override
				public void onClick(ClickEvent event) {
					dialogo.hide();
				}
			});
			HorizontalPanel botones = new HorizontalPanel();
			botones.add(closeButton);
			botones.add(aceptarButton);
			Label text = new Label(constantes.ingreseUsuarioYClave());
			Grid g = new Grid(2, 2);
			Label lUsuario = new Label(constantes.usuario());
			Label lClave = new Label(constantes.clave());
			final TextBox usuario = new TextBox();
			final PasswordTextBox clave = new PasswordTextBox();
			g.setWidget(0, 0, lUsuario);
			g.setWidget(1, 0, lClave);
			g.setWidget(0, 1, usuario);
			g.setWidget(1, 1, clave);
			aceptarButton.addClickHandler(new ClickHandler() {

				@Override
				public void onClick(ClickEvent event) {
					usuariosService.obtenerUsuario(usuario.getText(),
							clave.getText(), new AsyncCallback<Usuario>() {

								@Override
								public void onSuccess(Usuario result) {
									if (result != null) {
										contexto.setUsuarioLogueado(result);
										persistirLocales.setEnabled(true);
										labelUsuario.setText("l: "
												+ usuario.getText());
									} else {
										setMensajeAlerta(constantes
												.usuarioOClaveIncorrectos());
										loginCommand.execute();
									}
									dialogo.hide();
								}

								@Override
								public void onFailure(Throwable caught) {
									contexto.setOnline(false);
									setMensajeAlerta(constantes
											.errorAlLoguearSinConexion());
									dialogo.hide();

								}
							});
				}
			});
			DockPanel dock = new DockPanel();
			dock.setSpacing(4);
			dock.add(botones, DockPanel.SOUTH);
			dock.add(text, DockPanel.NORTH);
			dock.add(g, DockPanel.CENTER);
			botones.setHorizontalAlignment(HasHorizontalAlignment.ALIGN_RIGHT);
			dock.setWidth("100%");
			dialogo.setWidget(dock);
			dialogo.center();
		}
	};

	/**
	 * This is the entry point method.
	 */
	public void onModuleLoad() {
		// Storage.getLocalStorageIfSupported().clear();
		RootPanel rootPanel = RootPanel.get("menuContainer");
		rootPanel.add(crearMenu());
		actualizarCantidadObservacionesLocales();
		alertaPopup.setWidth("250px");
		alertaPopup.setHeight("170px");
		alertaPopup.setAnimationEnabled(true);
		alertaPopup.setAutoHideEnabled(true);
		alertaPopup.setModal(true);
		loginCommand.execute();
	}

	public static void actualizarCantidadObservacionesLocales() {
		RootPanel rootPanel = RootPanel.get("indicadorObservacionesContainer");
		rootPanel.clear();
		int cantidadObservacionesLocales = ManejadorAlmacenamientoLocal
				.getCantidadObservacionesPersistidas();
		if (cantidadObservacionesLocales > 0)
			rootPanel.add(new Label(constantes.cantidadObservacionesLocales()
					+ cantidadObservacionesLocales));
	}

	public static VentanaCarga cargarObservacion() {

		RootPanel rootPanel = RootPanel
				.get((dp.isOpen() ? "principalContainer2"
						: "principalContainer"));
		rootPanel.clear();
		VentanaCarga vc = new VentanaCarga();
		rootPanel.add(vc);
		return vc;
	}

	private Widget crearMenu() {
		// Create a command that will execute on menu item selection
		Command cargarCommand = new Command() {
			public void execute() {
				cargarObservacion();
			}
		};

		Command listarCommand = new Command() {
			public void execute() {
				RootPanel rootPanel = RootPanel.get("principalContainer2");
				rootPanel.clear();
				rootPanel.add(new VentanaListado());
			}
		};
		Command generarBackupCommand = new Command() {
			public void execute() {
				final PopupPanel popup = new PopupPanel();
				// popup.setWidth("px");
				// popup.setHeight("170px");
				popup.setAnimationEnabled(true);
				popup.setAutoHideEnabled(true);
				popup.setModal(true);

				popup.setWidget(new HTML(ManejadorAlmacenamientoLocal
						.getInfoBackup()));
				popup.setPopupPositionAndShow(new PopupPanel.PositionCallback() {
					public void setPosition(int offsetWidth, int offsetHeight) {
						popup.setPopupPositionAndShow(new PopupPanel.PositionCallback() {
							public void setPosition(int offsetWidth,
									int offsetHeight) {
								int left = ((Window.getClientWidth() - offsetWidth) / 2) >> 0;
								int top = (Window.getScrollTop() + (Window
										.getClientHeight() - offsetHeight) / 2) >> 0;
								popup.setPopupPosition(left, top);
							}
						});
					}
				});

			}
		};
		Command eliminarObservacionesLocalesCommand = new Command() {
			public void execute() {
				final DialogBoxExtendido dialogo = new DialogBoxExtendido();
				dialogo.setAnimationEnabled(true);
				dialogo.setText(constantes.confirmacion());
				Button aceptarButton = new Button("Aceptar");
				Button closeButton = new Button("Cancelar");
				closeButton.addClickHandler(new ClickHandler() {

					@Override
					public void onClick(ClickEvent event) {
						dialogo.hide();
					}
				});
				aceptarButton.addClickHandler(new ClickHandler() {

					@Override
					public void onClick(ClickEvent event) {
						ManejadorAlmacenamientoLocal
								.eliminarObservacionesLocales();
						actualizarCantidadObservacionesLocales();
						dialogo.hide();
					}
				});
				HorizontalPanel botones = new HorizontalPanel();
				botones.add(closeButton);
				botones.add(aceptarButton);
				Label text = new Label(constantes.seguroDeBorrarObsLocales());

				DockPanel dock = new DockPanel();
				dock.setSpacing(4);
				dock.add(botones, DockPanel.SOUTH);
				dock.add(text, DockPanel.CENTER);
				botones.setHorizontalAlignment(HasHorizontalAlignment.ALIGN_RIGHT);
				dock.setWidth("100%");
				dialogo.setWidget(dock);
				dialogo.center();
			}
		};

		Command persistirLocalesCommand = new Command() {
			public void execute() {
				persistirObservacionesLocales();
			}

			private void persistirObservacionesLocales() {

				ManejadorAlmacenamientoLocal.persistirDatosLocales();
			}

		};

		Command nadaCommand = new Command() {
			public void execute() {
				// TODO: hacer
			}
		};

		dp.setAnimationEnabled(true);
		dp.setOpen(true);

		// Create a menu bar
		MenuBar menu = new MenuBar(true);
		menu.setAutoOpen(true);
		menu.setAnimationEnabled(true);

		MenuBar observacionesMenu = new MenuBar(true);
		MenuBar configuracionMenu = new MenuBar(true);
		MenuBar ayudaMenu = new MenuBar(true);

		observacionesMenu.addItem(constantes.cargar(), cargarCommand);
		observacionesMenu.addItem(constantes.ver(), listarCommand);
		persistirLocales=new MenuItem(constantes.persistirLocales(),
				persistirLocalesCommand);
		persistirLocales.setEnabled(false);
		observacionesMenu.addItem(persistirLocales);
		observacionesMenu.addItem(constantes.cerrarSesion(), loginCommand);
		menu.addItem(new MenuItem(constantes.observaciones(), observacionesMenu));

		configuracionMenu.addItem(constantes.preferencias(), nadaCommand);
		final MenuItem mi = new MenuItem(constantes.nombreComun(), nadaCommand);

		mi.setCommand(new Command() {

			@Override
			public void execute() {
				configuracion.setNombreCientifico(!configuracion
						.isNombreCientifico());
				mi.setText(configuracion.isNombreCientifico() ? constantes
						.nombreCientifico() : constantes.nombreComun());
			}
		});
		configuracionMenu.addItem(mi);
		configuracionMenu.addItem(constantes.generarBackup(),
				generarBackupCommand);
		configuracionMenu.addItem(constantes.eliminarObservacionesLocales(),
				eliminarObservacionesLocalesCommand);

		menu.addItem(new MenuItem(constantes.configuracion(), configuracionMenu));

		final MenuItem mAyuda = new MenuItem(constantes.ayuda(), nadaCommand);
		mAyuda.setEnabled(false);
		ayudaMenu.addItem(mAyuda);
		ayudaMenu.addItem(constantes.acercaDe(), new Command() {
			@Override
			public void execute() {
				setMensajeAlerta("PatoGIS - 2011");
				setMensajeAlerta("Tesis de: Gabriel Alvarez");
				setMensajeAlerta("Director: Mg. Ing. Jos\u00E9 M. Massa");
				setMensajeAlerta("Co-Directora: Med. Vet. Andrea Caselli");
				setMensajeAlerta("Facultad de Ciecias Exactas");
				setMensajeAlerta("UNICEN");

			}
		});
		menu.addItem(new MenuItem(constantes.ayuda(), ayudaMenu));
		labelUsuario = new MenuItem("l: ", nadaCommand);
		labelUsuario.setEnabled(false);
		menu.addItem(labelUsuario);
		dp.setContent(menu);
		dp.addOpenHandler(new OpenHandler<DisclosurePanel>() {
			@Override
			public void onOpen(OpenEvent<DisclosurePanel> event) {
				RootPanel rootPanel = RootPanel.get("principalContainer");
				RootPanel rootPanel2 = RootPanel.get("principalContainer2");
				if (rootPanel.getWidgetCount() > 0)
					rootPanel2.add(rootPanel.getWidget(0));
				rootPanel.clear();
			}
		});
		dp.addCloseHandler(new CloseHandler<DisclosurePanel>() {

			@Override
			public void onClose(CloseEvent<DisclosurePanel> event) {
				RootPanel rootPanel2 = RootPanel.get("principalContainer");
				RootPanel rootPanel = RootPanel.get("principalContainer2");
				if (rootPanel.getWidgetCount() > 0)
					rootPanel2.add(rootPanel.getWidget(0));
				rootPanel.clear();
			}
		});
		return dp;
	}

}
package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.List;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.core.client.GWT;
import com.google.gwt.storage.client.Storage;
import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.Timer;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.MenuBar;
import com.google.gwt.user.client.ui.MenuItem;
import com.google.gwt.user.client.ui.PopupPanel;
import com.google.gwt.user.client.ui.RootPanel;

/**
 * Entry point classes define <code>onModuleLoad()</code>.
 */
public class AplicacionWeb implements EntryPoint {
	static AplicacionWebConstantes constantes = GWT
			.create(AplicacionWebConstantes.class);
	public static Configuracion configuracion = new Configuracion();
	public static PopupPanel alertaPopup = new PopupPanel();
	private static String mensajeActual;
	public static boolean online = true;	
	
	final ObservacionServiceAsync observacionService = GWT
			.create(ObservacionService.class);
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
			alertaPopup.center();
		}
		t.schedule(7000);
	}

	/**
	 * This is the entry point method.
	 */
	public void onModuleLoad() {
	//	Storage.getLocalStorageIfSupported().clear();
		RootPanel rootPanel = RootPanel.get("menuContainer");
		rootPanel.add(crearMenu());
		actualizarCantidadObservacionesLocales();
		alertaPopup.setWidth("250px");
		alertaPopup.setHeight("100px");
		alertaPopup.setAnimationEnabled(true);
		alertaPopup.setAutoHideEnabled(true);
		alertaPopup.setModal(true);
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

	public static void cargarObservacion() {
		RootPanel rootPanel = RootPanel.get("principalContainer");
		rootPanel.clear();
		rootPanel.add(new VentanaCarga());
	}

	private MenuBar crearMenu() {
		// Create a command that will execute on menu item selection
		Command cargarCommand = new Command() {
			public void execute() {
				cargarObservacion();
			}
		};

		Command listarCommand = new Command() {
			public void execute() {
				RootPanel rootPanel = RootPanel.get("principalContainer");
				rootPanel.clear();
				rootPanel.add(new VentanaListado());
			}
		};
		
		Command eliminarObservacionesLocalesCommand= new Command() {
			public void execute() {
				ManejadorAlmacenamientoLocal.eliminarObservacionesLocales();
				actualizarCantidadObservacionesLocales();
			}
		};
		
		Command persistirLocalesCommand = new Command() {
			public void execute() {
				List<Observacion> observaciones = ManejadorAlmacenamientoLocal
						.obtenerObservacionesPersistidas();
				for (Observacion observacion : observaciones) {
					observacionService.addElemento(observacion,
							new AsyncCallback<Void>() {

								@Override
								public void onFailure(Throwable caught) {
									AplicacionWeb.setMensajeAlerta(constantes
											.errorGuardarObservacion());
								}

								@Override
								public void onSuccess(Void result) {
									AplicacionWeb.setMensajeAlerta(constantes
											.observacionGuardada());
									ManejadorAlmacenamientoLocal.setCantidadObservacionesPersistidas(0);
								}
							});
				}
			}
		};

		Command nadaCommand = new Command() {
			public void execute() {
				// TODO: hacer
			}
		};

		// Create a menu bar
		MenuBar menu = new MenuBar();
		menu.setAutoOpen(true);
		menu.setWidth("365px");
		menu.setAnimationEnabled(true);

		MenuBar observacionesMenu = new MenuBar(true);
		MenuBar configuracionMenu = new MenuBar(true);
		MenuBar ayudaMenu = new MenuBar(true);

		observacionesMenu.addItem(constantes.cargar(), cargarCommand);
		observacionesMenu.addItem(constantes.ver(), listarCommand);
		observacionesMenu.addItem(constantes.persistirLocales(),
				persistirLocalesCommand);
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
		configuracionMenu.addItem(constantes.eliminarObservacionesLocales(), eliminarObservacionesLocalesCommand);

		
		menu.addItem(new MenuItem(constantes.configuracion(), configuracionMenu));

		ayudaMenu.addItem(constantes.ayuda(), nadaCommand);
		ayudaMenu.addItem(constantes.acercaDe(), nadaCommand);
		menu.addItem(new MenuItem("Ayuda", ayudaMenu));

		menu.addItem(constantes.cerrarSesion(), nadaCommand);

		return menu;
	}

}
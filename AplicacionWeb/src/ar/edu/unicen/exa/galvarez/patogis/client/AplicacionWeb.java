package ar.edu.unicen.exa.galvarez.patogis.client;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.core.client.GWT;
import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.Timer;
import com.google.gwt.user.client.ui.DecoratedPopupPanel;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.MenuBar;
import com.google.gwt.user.client.ui.MenuItem;
import com.google.gwt.user.client.ui.PopupPanel;
import com.google.gwt.user.client.ui.RootPanel;

/**
 * Entry point classes define <code>onModuleLoad()</code>.
 */
public class AplicacionWeb implements EntryPoint {
	AplicacionWebConstantes constantes = GWT
			.create(AplicacionWebConstantes.class);
	public static Configuracion configuracion = new Configuracion();
	public static PopupPanel alertaPopup= new PopupPanel() ;
			
public static void setMensajeAlerta(String mensaje){
	alertaPopup.setWidget(
        new HTML(mensaje));
	alertaPopup.center();
	
	Timer t = new Timer() {

		public void run() {
			alertaPopup.hide();
		}

	};
	t.schedule(5000);
}

	/**
	 * This is the entry point method.
	 */
	public void onModuleLoad() {

		RootPanel rootPanel = RootPanel.get("menuContainer");
		rootPanel.add(crearMenu());
		 
		alertaPopup.setWidth("250px");
		alertaPopup.setHeight("100px");
		alertaPopup.setAnimationEnabled(true);
		alertaPopup.setAutoHideEnabled(true);
		alertaPopup.setModal(true);
		//alertaPopup.
	}

	private MenuBar crearMenu() {
		// Create a command that will execute on menu item selection
		Command cargarCommand = new Command() {

			public void execute() {
				RootPanel rootPanel = RootPanel.get("principalContainer");
				rootPanel.clear();
				rootPanel.add(new VentanaCarga());
			}
		};
		Command listarCommand = new Command() {

			public void execute() {
				RootPanel rootPanel = RootPanel.get("principalContainer");
				rootPanel.clear();
				rootPanel.add(new VentanaListado());
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

		menu.addItem(new MenuItem(constantes.configuracion(), configuracionMenu));

		ayudaMenu.addItem(constantes.ayuda(), nadaCommand);
		ayudaMenu.addItem(constantes.acercaDe(), nadaCommand);
		menu.addItem(new MenuItem("Ayuda", ayudaMenu));

		menu.addItem(constantes.cerrarSesion(), nadaCommand);

		return menu;
	}

}
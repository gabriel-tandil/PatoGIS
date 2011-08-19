package ar.edu.unicen.exa.galvarez.patogis.client;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.MenuBar;
import com.google.gwt.user.client.ui.MenuItem;
import com.google.gwt.user.client.ui.RootPanel;

/**
 * Entry point classes define <code>onModuleLoad()</code>.
 */
public class AplicacionWeb implements EntryPoint {

	/**
	 * This is the entry point method.
	 */
	public void onModuleLoad() {

		RootPanel rootPanel = RootPanel.get("menuContainer");
		rootPanel.add(crearMenu());
		RootPanel.get("errorLabelContainer").add(new Label());
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
		// Create a menu bar
		MenuBar menu = new MenuBar();
		menu.setAutoOpen(true);
		menu.setWidth("100%");
		menu.setAnimationEnabled(true);

		// Create a sub menu of recent documents
		MenuBar observacionesMenu = new MenuBar(true);

		observacionesMenu.addItem("Cargar", cargarCommand);
		observacionesMenu.addItem("Ver", listarCommand);

		menu.addItem(new MenuItem("Observaciones", observacionesMenu));

		return menu;
	}

}
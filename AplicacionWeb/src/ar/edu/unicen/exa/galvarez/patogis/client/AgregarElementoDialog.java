package ar.edu.unicen.exa.galvarez.patogis.client;

import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.DeferredCommand;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.DialogBox;
import com.google.gwt.user.client.ui.DockPanel;
import com.google.gwt.user.client.ui.HasHorizontalAlignment;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.ListBox;
import com.google.gwt.user.client.ui.PopupPanel;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.VerticalPanel;

@SuppressWarnings("deprecation")
abstract class AgregarElementoDialog extends DialogBox {

	protected ListBox combo;

	public ListBox getCombo() {
		return combo;
	}

	public void setCombo(ListBox combo) {
		this.combo = combo;
	}

	TextBox text = null;
	Label errorLabel = null;
	VerticalPanel panel = null;
	VerticalPanel etiquetas = null;
	public AgregarElementoDialog() {
		setAnimationEnabled(true);
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

		panel=new VerticalPanel();
		etiquetas=new VerticalPanel();
		etiquetas.add(label);
		dock.add(etiquetas, DockPanel.WEST);
		panel.add(text);
		dock.add(panel, DockPanel.CENTER);

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

	@Override
	public void center() {
		setPopupPositionAndShow(new PopupPanel.PositionCallback() {
			public void setPosition(int offsetWidth, int offsetHeight) {
				int left = ((Window.getClientWidth() - offsetWidth) / 2) >> 0;
				int top = ((Window.getClientHeight() - offsetHeight) / 2) >> 0;
				setPopupPosition(left, top);
			}
		});
	}
}
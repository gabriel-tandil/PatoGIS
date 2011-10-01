package ar.edu.unicen.exa.galvarez.patogis.client;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionEspecie;

import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.DOM;
import com.google.gwt.user.client.DeferredCommand;
import com.google.gwt.user.client.Event;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.DialogBox;
import com.google.gwt.user.client.ui.DockPanel;
import com.google.gwt.user.client.ui.HasHorizontalAlignment;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.PopupPanel;
import com.google.gwt.user.client.ui.TextBox;

@SuppressWarnings("deprecation")
public class CantidadBox extends TextBox {

	public CantidadBox() {
		super.sinkEvents(Event.ONKEYDOWN);
	}

	public void onBrowserEvent(Event event) {
		int eventType = DOM.eventGetType(event);
		int keyCode = DOM.eventGetKeyCode(event);

		switch (eventType) {
		case Event.ONKEYDOWN: {
			if (keyCode == 83){
				class SumarDialog extends DialogBox {

					public SumarDialog() {
						setText("Sumar");
						
						setAnimationEnabled(true);
						final CantidadBox cb=new CantidadBox();
						Button aceptarButton = new Button("Aceptar");
						Button closeButton = new Button("Cancelar");
						closeButton.addClickHandler(new ClickHandler() {

							@Override
							public void onClick(ClickEvent event) {
								hide();
							}
						});
						aceptarButton.addClickHandler(new ClickHandler() {

							@Override
							public void onClick(ClickEvent event) {
									try {
										setValue(new Integer(parseValue()+cb.parseValue()).toString());
									} catch (ValidacionException e) {
										AplicacionWeb.setMensajeAlerta(e.getMensaje());
									}
									hide();
							}
						});
						HorizontalPanel botones = new HorizontalPanel();
						botones.add(closeButton);
						botones.add(aceptarButton);

						DockPanel dock = new DockPanel();
						dock.setSpacing(4);
						dock.add(cb, DockPanel.CENTER);
						dock.add(botones, DockPanel.SOUTH);

						botones.setHorizontalAlignment(HasHorizontalAlignment.ALIGN_RIGHT);
						dock.setWidth("100%");
						setWidget(dock);

						DeferredCommand.addCommand(new Command() {
							public void execute() {
								cb.setFocus(true);
							}
						});
					}

					@Override
					public void center() {
						setPopupPositionAndShow(new PopupPanel.PositionCallback() {
							public void setPosition(int offsetWidth, int offsetHeight) {
								int left = ((Window.getClientWidth() - offsetWidth) / 2) >> 0;
								int top = (Window.getScrollTop()+(Window.getClientHeight() - offsetHeight) / 2) >> 0;
								setPopupPosition(left, top);
							}
						});
					}
				}
				DialogBox db=new SumarDialog();
				db.center();
			}
			if (isCantidadKey(keyCode)) {
				char newChar = ((char) convert(keyCode));
				setText(getText() + String.valueOf(newChar));
				DOM.eventPreventDefault(event);
				return;
			}
		}
		default:
			super.onBrowserEvent(event);
		}
	}

	private int convert(int keyCode) {
		// convert 0 - 9 keys on number pad down into normal 0 - 9 range
		if (keyCode >= 96 && keyCode <= 105) {
			return keyCode - 48;
		} else if (keyCode == 81) { // qwertyuiop -> 0-9
			keyCode = 49;
		} else if (keyCode == 87) {
			keyCode = 50;
		} else if (keyCode == 69) {
			keyCode = 51;
		} else if (keyCode == 82) {
			keyCode = 52;
		} else if (keyCode == 84) {
			keyCode = 53;
		} else if (keyCode == 89) {
			keyCode = 54;
		} else if (keyCode == 85) {
			keyCode = 55;
		} else if (keyCode == 37) {
			keyCode = 56;
		} else if (keyCode == 79) {
			keyCode = 57;
		} else if (keyCode == 80) {
			keyCode = 48;
		}
		return keyCode;
	}

	private boolean isCantidadKey(int keyCode) {
		// 0 - 9 keys above qwerty
		if (keyCode >= 48 && keyCode <= 57) {
			return true;
		}
		// 0 - 9 keys on number pad
		if (keyCode >= 96 && keyCode <= 105) {
			return true;
		}
		// QWERTYUIOP keys
		if (keyCode == 81 || keyCode == 87 || keyCode == 69 || keyCode == 82
				|| keyCode == 84 || keyCode == 89 || keyCode == 85
				|| keyCode == 37 || keyCode == 79 || keyCode == 80) {
			return true;
		}
		if (keyCode == 88) { // X
			return true;
		}

		return false;
	}

	public Integer parseValue() throws ValidacionException {
		if (getValue().equals("X"))
			return new Integer(ObservacionEspecie.PRESENCIA);
		if (getValue().equals("XX"))
			return new Integer(ObservacionEspecie.PRESENCIA_MUCHOS);
		try {
			return Integer.parseInt(getValue());
		} catch (NumberFormatException e) {
			throw new ValidacionException("Cantidad Incorrecta.");
		}

	}

}

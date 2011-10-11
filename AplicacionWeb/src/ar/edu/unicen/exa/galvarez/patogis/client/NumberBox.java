package ar.edu.unicen.exa.galvarez.patogis.client;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionEspecie;

import com.google.gwt.user.client.DOM;
import com.google.gwt.user.client.Event;
import com.google.gwt.user.client.ui.TextBox;

public class NumberBox extends TextBox {

	public NumberBox() {
		super.sinkEvents(Event.ONKEYDOWN);
	}

	public void onBrowserEvent(Event event) {
		int eventType = DOM.eventGetType(event);
		int keyCode = DOM.eventGetKeyCode(event);

		switch (eventType) {
		case Event.ONKEYDOWN: {
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

	public void setDouble(Double d) {
		setValue(Double.toString(d).replace('.', ','));
		
	}

	public Double getDouble() throws ValidacionException {
		try {
			return Double.parseDouble(getValue().replace(',', '.'));
		} catch (NumberFormatException e) {
			throw new ValidacionException("Cantidad Incorrecta.");
		}
	}

	public Integer getInteger() throws ValidacionException {
		try {
			return Integer.parseInt(getValue());
		} catch (NumberFormatException e) {
			throw new ValidacionException("Cantidad Incorrecta.");
		}
	}

	public void setInteger(Integer i) {
		setValue(Integer.toString(i));
	}

}

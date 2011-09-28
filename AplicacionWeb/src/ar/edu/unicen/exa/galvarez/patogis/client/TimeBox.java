package ar.edu.unicen.exa.galvarez.patogis.client;

import com.google.gwt.user.client.DOM;
import com.google.gwt.user.client.Event;
import com.google.gwt.user.client.ui.TextBox;

public class TimeBox extends TextBox {

	public final static String DEFAULT_TIME_FORMAT = "HH:mm";

	private String format = DEFAULT_TIME_FORMAT;

	public TimeBox() {
		setFormat(DEFAULT_TIME_FORMAT);
		super.sinkEvents(Event.ONKEYDOWN);
	}

	public TimeBox(String format) {
		setFormat(format);
		super.sinkEvents(Event.ONKEYDOWN);
	}

	public void onBrowserEvent(Event event) {
		int eventType = DOM.eventGetType(event);
		int keyCode = DOM.eventGetKeyCode(event);

		switch (eventType) {
		case Event.ONKEYDOWN: {
			if (isTimeKey(keyCode)) {
				char newChar = ((char) convert(keyCode));
				setText(getText() + String.valueOf(newChar));
				if (getText().length() == 2)
					setText(getText() + ":");
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
		} else if (keyCode == 81) {
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

	private boolean isTimeKey(int keyCode) {
		// 0 - 9 keys above qwerty
		if (keyCode >= 48 && keyCode <= 57) {
			return true;
		}
		// 0 - 9 keys on number pad
		if (keyCode >= 96 && keyCode <= 105) {
			return true;
		}
		// A, M, P keys
		if (keyCode == 81 || keyCode == 87 || keyCode == 69 || keyCode == 82
				|| keyCode == 84 || keyCode == 89 || keyCode == 85
				|| keyCode == 37 || keyCode == 79 || keyCode == 80) {
			return true;
		}
		return false;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
		super.setMaxLength(format.length());
		super.setVisibleLength(format.length());

	}
}

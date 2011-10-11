package ar.edu.unicen.exa.galvarez.patogis.client;

import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.DialogBox;
import com.google.gwt.user.client.ui.PopupPanel;

public class DialogBoxExtendido extends DialogBox {
	@Override
	public void center() {
		setPopupPositionAndShow(new PopupPanel.PositionCallback() {
			public void setPosition(int offsetWidth,
					int offsetHeight) {
				int left = ((Window.getClientWidth() - offsetWidth) / 2) >> 0;
				int top = (Window.getScrollTop() + (Window
						.getClientHeight() - offsetHeight) / 2) >> 0;
				setPopupPosition(left, top);
			}
		});
	}
}

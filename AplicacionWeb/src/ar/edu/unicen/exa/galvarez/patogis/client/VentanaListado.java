package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.Iterator;
import java.util.List;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionEspecie;

import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.i18n.client.DateTimeFormat;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.DialogBox;
import com.google.gwt.user.client.ui.DockPanel;
import com.google.gwt.user.client.ui.FlexTable;
import com.google.gwt.user.client.ui.HasHorizontalAlignment;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.RootPanel;

public class VentanaListado extends FlexTable {

	final ObservacionServiceAsync observacionService = GWT
	.create(ObservacionService.class);
	VentanaListado() {
		super();
		final Label errorLabel =(Label) RootPanel.get("errorLabelContainer").getWidget(0);
		setText(0, 0, "Fecha");
		setText(0, 1, "Inicio");
		setText(0, 2, "Fin");
		setText(0, 3, "Laguna");
		setText(0, 4, "Detalles");
		getRowFormatter().addStyleName(0, "watchListHeader");
		addStyleName("watchList");
		getCellFormatter().addStyleName(0, 0, "watchListNumericColumn");
		getCellFormatter().addStyleName(0, 1, "watchListNumericColumn");
		getCellFormatter().addStyleName(0, 2, "watchListNumericColumn");
		getCellFormatter().addStyleName(0, 4, "watchListRemoveColumn");

		observacionService.getElementos(new AsyncCallback<List<Observacion>>() {
			@Override
			public void onFailure(Throwable caught) {
				errorLabel
						.setText("Error al obtener observaciones del webservice");

			}

			public void onSuccess(List<Observacion> result) {

				for (Iterator<Observacion> iterator = result.iterator(); iterator
						.hasNext();) {
					final Observacion observacion = iterator.next();
					int fila = getRowCount();
					setText(fila, 0, DateTimeFormat.getFormat("dd/MM/yy")
							.format(observacion.getInicio()));

					setText(fila, 1, DateTimeFormat.getFormat("HH:mm")
							.format(observacion.getInicio()));

					setText(fila, 2, DateTimeFormat.getFormat("HH:mm")
							.format(observacion.getFin()));
					setText(fila, 3, observacion.getUbicacion()
							.getNombre());
					Button detalles = new Button("Detalles");
					detalles.addClickHandler(new ClickHandler() {
						public void onClick(ClickEvent event) {
							mostrarDetalles(observacion);
						}

						private void mostrarDetalles(Observacion observacion) {
							DetallesObservacionDialog dlg = new DetallesObservacionDialog(
									observacion);
							dlg.center();

						}
					});
					setWidget(fila, 4, detalles);
				}
			};

		});


	}

	class DetallesObservacionDialog extends DialogBox {

		public DetallesObservacionDialog(Observacion obs) {
			setText("Detalles Observación");
			setAnimationEnabled(true);
			Button closeButton = new Button("Cancelar");
			closeButton.addClickHandler(new ClickHandler() {
				@Override
				public void onClick(ClickEvent event) {
					cerrar();
				}
			});

			HorizontalPanel botones = new HorizontalPanel();
			botones.add(closeButton);
			FlexTable tabla = new FlexTable();

			tabla.setText(0, 0, "Especie");
			tabla.setText(0, 1, "Cantidad");
			tabla.getRowFormatter().addStyleName(0, "watchListHeader");
			tabla.addStyleName("watchList");
			tabla.getCellFormatter().addStyleName(0, 1,
					"watchListNumericColumn");

			for (ObservacionEspecie observacionEspecie : obs
					.getObservacionesEspecie()) {
				int fila = tabla.getRowCount();
				tabla.setText(fila, 0, observacionEspecie.getEspecie()
						.getNombre());
				tabla.setText(fila, 1, observacionEspecie.getCantidad()
						.toString());
			}
			DockPanel dock = new DockPanel();
			dock.setSpacing(4);

			dock.add(botones, DockPanel.SOUTH);

			dock.add(tabla, DockPanel.CENTER);

			botones.setHorizontalAlignment(HasHorizontalAlignment.ALIGN_RIGHT);
			dock.setWidth("100%");
			setWidget(dock);

		}

		public void cerrar() {
			hide();
		}

	}
}

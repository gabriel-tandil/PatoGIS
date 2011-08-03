package ar.edu.unicen.exa.galvarez.patogis.client;

import com.google.gwt.user.client.rpc.AsyncCallback;

class AgregarUbicacionDialog extends AgregarElementoObservableDialog {

	/**
	 * 
	 */
	private final AplicacionWeb aplicacionWeb;

	public AgregarUbicacionDialog(AplicacionWeb aplicacionWeb) {
		this.aplicacionWeb= aplicacionWeb;
		setText("Ingresar Nombre Nueva Ubicación");
	}

	protected void grabar() {
		aplicacionWeb.ubicacionService.addElemento(text.getValue(),
				new AsyncCallback<Void>() {
					public void onFailure(Throwable caught) {
						errorLabel
								.setText("Error al guardar nueva ubicación via webService");
					}

					@Override
					public void onSuccess(Void result) {
						// nada

					}
				});
		aplicacionWeb.ubicaciones.add(text.getValue());
		aplicacionWeb.establecerElementoCombo(combo, text.getValue());
		hide();
	}

}
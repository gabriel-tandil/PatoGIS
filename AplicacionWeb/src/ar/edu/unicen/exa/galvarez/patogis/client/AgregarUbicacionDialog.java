package ar.edu.unicen.exa.galvarez.patogis.client;

import com.google.gwt.user.client.rpc.AsyncCallback;

class AgregarUbicacionDialog extends AgregarElementoObservableDialog {

	/**
	 * 
	 */
	private final AplicacionWeb agregarUbicacionDialog;

	public AgregarUbicacionDialog(AplicacionWeb aplicacionWeb) {
		agregarUbicacionDialog = aplicacionWeb;
		setText("Ingresar Nombre Nueva Ubicación");
	}

	protected void grabar() {
		agregarUbicacionDialog.ubicacionService.addElemento(text.getValue(),
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
		agregarUbicacionDialog.ubicaciones.add(text.getValue());
		agregarUbicacionDialog.establecerElementoCombo(combo, text.getValue());
		hide();
	}

}
package ar.edu.unicen.exa.galvarez.patogis.client;

import com.google.gwt.user.client.rpc.AsyncCallback;

class AgregarEspecieDialog extends AgregarElementoObservableDialog {

	/**
	 * 
	 */
	private final AplicacionWeb agregarEspecieDialog;

	public AgregarEspecieDialog(AplicacionWeb aplicacionWeb) {
		agregarEspecieDialog = aplicacionWeb;
		setText("Ingresar Nueva Especie");
	}

	protected void grabar() {
		agregarEspecieDialog.especiesService.addElemento(text.getValue(),
				new AsyncCallback<Void>() {
					public void onFailure(Throwable caught) {
						errorLabel
								.setText("Error al guardar nueva especie via webService");
					}

					@Override
					public void onSuccess(Void result) {
						// nada

					}
				});
		agregarEspecieDialog.especies.add(text.getValue());
		agregarEspecieDialog.establecerElementoCombo(combo, text.getValue());
		hide();
	}

}
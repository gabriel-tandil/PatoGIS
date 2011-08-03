package ar.edu.unicen.exa.galvarez.patogis.client;

import com.google.gwt.user.client.rpc.AsyncCallback;

class AgregarEspecieDialog extends AgregarElementoObservableDialog {

	/**
	 * 
	 */
	private final AplicacionWeb aplicacionWeb;

	public AgregarEspecieDialog(AplicacionWeb aplicacionWeb) {
		this.aplicacionWeb = aplicacionWeb;
		setText("Ingresar Nueva Especie");
	}

	protected void grabar() {
		aplicacionWeb.especiesService.addElemento(text.getValue(),
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
		aplicacionWeb.especies.add(text.getValue());
		aplicacionWeb.establecerElementoCombo(combo, text.getValue());
		hide();
	}

}
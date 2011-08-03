package ar.edu.unicen.exa.galvarez.patogis.client;

import com.google.gwt.user.client.rpc.AsyncCallback;

class AgregarTipoMatrizProductivaDialog extends
		AgregarElementoObservableDialog {

	/**
	 * 
	 */
	private final AplicacionWeb aplicacionWeb;

	public AgregarTipoMatrizProductivaDialog(AplicacionWeb aplicacionWeb) {
		this.aplicacionWeb = aplicacionWeb;
		setText("Ingresar Nuevo Tipo de Matriz Productiva");
	}

	protected void grabar() {
		aplicacionWeb.tipoMatrizProductivaService.addElemento(text.getValue(),
				new AsyncCallback<Void>() {
					public void onFailure(Throwable caught) {
						errorLabel
								.setText("Error al guardar nuevo tipo de matriz productiva via webService");
					}

					@Override
					public void onSuccess(Void result) {
						// nada

					}
				});
		aplicacionWeb.tiposMatrizProductiva.add(text.getValue());
		aplicacionWeb.establecerElementoCombo(combo, text.getValue());
		hide();
	}

}
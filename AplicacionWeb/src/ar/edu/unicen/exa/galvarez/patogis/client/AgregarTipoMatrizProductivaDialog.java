package ar.edu.unicen.exa.galvarez.patogis.client;

import com.google.gwt.user.client.rpc.AsyncCallback;

class AgregarTipoMatrizProductivaDialog extends
		AgregarElementoObservableDialog {

	/**
	 * 
	 */
	private final AplicacionWeb agregarTipoMatrizProductivaDialog;

	public AgregarTipoMatrizProductivaDialog(AplicacionWeb aplicacionWeb) {
		agregarTipoMatrizProductivaDialog = aplicacionWeb;
		setText("Ingresar Nuevo Tipo de Matriz Productiva");
	}

	protected void grabar() {
		agregarTipoMatrizProductivaDialog.tipoMatrizProductivaService.addElemento(text.getValue(),
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
		agregarTipoMatrizProductivaDialog.tiposMatrizProductiva.add(text.getValue());
		agregarTipoMatrizProductivaDialog.establecerElementoCombo(combo, text.getValue());
		hide();
	}

}
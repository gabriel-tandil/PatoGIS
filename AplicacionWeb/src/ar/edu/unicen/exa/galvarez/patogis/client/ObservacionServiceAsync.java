package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.List;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion;

import com.google.gwt.user.client.rpc.AsyncCallback;

/**
 * The async counterpart of <code>ObservacionService</code>.
 */
public interface ObservacionServiceAsync {
	void getElementos(AsyncCallback<List<Observacion>> asyncCallback);

	void addElemento(Observacion observacion, String usuario, String clave,
			AsyncCallback<Void> callback);

	void editElemento(Observacion observacion, String usuario, String clave,
			AsyncCallback<Void> asyncCallback);
}

package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.Map;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Ubicacion;

import com.google.gwt.user.client.rpc.AsyncCallback;

/**
 * The async counterpart of <code>UbicacionService</code>.
 */
public interface UbicacionServiceAsync {
	void getElementos(AsyncCallback<Map<String, Ubicacion>> asyncCallback);

	void addElemento(Ubicacion ubicacion, AsyncCallback<Void> callback);
}

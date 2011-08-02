package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.List;

import com.google.gwt.user.client.rpc.AsyncCallback;

/**
 * The async counterpart of <code>UbicacionService</code>.
 */
public interface UbicacionServiceAsync {
	void getElementos(AsyncCallback<List<String>> asyncCallback);

	void addElemento(String ubicacion, AsyncCallback<Void> callback);
}

package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.List;

import com.google.gwt.user.client.rpc.AsyncCallback;

/**
 * The async counterpart of <code>EspeciesService</code>.
 */
public interface EspeciesServiceAsync {
	void getElementos(AsyncCallback<List<String>> asyncCallback);

	void addElemento(String Especie, AsyncCallback<Void> callback);
}

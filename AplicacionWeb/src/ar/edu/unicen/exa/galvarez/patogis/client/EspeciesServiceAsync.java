package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.List;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;

import com.google.gwt.user.client.rpc.AsyncCallback;

/**
 * The async counterpart of <code>EspeciesService</code>.
 */
public interface EspeciesServiceAsync {
	void getElementos(AsyncCallback<List<Especie>> asyncCallback);

	void addElemento(Especie especie, AsyncCallback<Void> callback);
}

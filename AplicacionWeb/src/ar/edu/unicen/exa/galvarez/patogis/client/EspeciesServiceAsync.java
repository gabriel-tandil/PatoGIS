package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.List;

import com.google.gwt.user.client.rpc.AsyncCallback;

/**
 * The async counterpart of <code>EspeciesService</code>.
 */
public interface EspeciesServiceAsync {
	void getEspecies(AsyncCallback<List<String>> asyncCallback);

	void addEspecie(String Especie, AsyncCallback<Void> callback);
}

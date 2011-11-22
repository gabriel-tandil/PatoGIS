package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.Map;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;

import com.google.gwt.user.client.rpc.AsyncCallback;

/**
 * The async counterpart of <code>EspeciesService</code>.
 */
public interface EspeciesServiceAsync {
	void getElementos(AsyncCallback<Map<String, Especie>> asyncCallback);

	void addElemento(Especie especie, String usuario, String clave,
			AsyncCallback<Void> callback);
}

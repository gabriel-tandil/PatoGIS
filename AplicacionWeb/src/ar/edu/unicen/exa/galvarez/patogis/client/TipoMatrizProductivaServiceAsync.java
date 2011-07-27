package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.List;

import com.google.gwt.user.client.rpc.AsyncCallback;

/**
 * The async counterpart of <code>TipoMatrizProductivaService</code>.
 */
public interface TipoMatrizProductivaServiceAsync {
	void getElementos(AsyncCallback<List<String>> asyncCallback);

	void addElemento(String tipoMatrizProductiva, AsyncCallback<Void> callback);
}

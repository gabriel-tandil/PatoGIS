package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.Map;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.TipoMatrizProductiva;

import com.google.gwt.user.client.rpc.AsyncCallback;

/**
 * The async counterpart of <code>TipoMatrizProductivaService</code>.
 */
public interface TipoMatrizProductivaServiceAsync {
	void getElementos(AsyncCallback<Map<String, TipoMatrizProductiva>> asyncCallback);

	void addElemento(TipoMatrizProductiva tipoMatrizProductiva,
			AsyncCallback<Void> callback);
}

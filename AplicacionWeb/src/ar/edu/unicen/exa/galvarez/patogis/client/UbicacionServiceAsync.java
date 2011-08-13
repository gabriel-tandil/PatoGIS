package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.List;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Ubicacion;

import com.google.gwt.user.client.rpc.AsyncCallback;

/**
 * The async counterpart of <code>UbicacionService</code>.
 */
public interface UbicacionServiceAsync {
	void getElementos(AsyncCallback<List<Ubicacion>> asyncCallback);

	void addElemento(Ubicacion ubicacion, AsyncCallback<Void> callback);
}

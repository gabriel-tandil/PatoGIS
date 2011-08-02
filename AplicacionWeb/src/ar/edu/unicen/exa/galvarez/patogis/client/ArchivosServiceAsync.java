package ar.edu.unicen.exa.galvarez.patogis.client;

import com.google.gwt.user.client.rpc.AsyncCallback;

/**
 * The async counterpart of <code>UbicacionService</code>.
 */
public interface ArchivosServiceAsync {

	void borrar(String archivo, AsyncCallback<Void> callback);
}

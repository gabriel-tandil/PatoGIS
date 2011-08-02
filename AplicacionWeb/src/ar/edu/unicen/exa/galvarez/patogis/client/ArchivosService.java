package ar.edu.unicen.exa.galvarez.patogis.client;

import com.google.gwt.user.client.rpc.RemoteService;
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;

/**
 * The client side stub for the RPC service.
 */
@RemoteServiceRelativePath("archivos")
public interface ArchivosService extends RemoteService {

	void borrar(String archivo);
}

package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.List;

import com.google.gwt.user.client.rpc.RemoteService;
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;

/**
 * The client side stub for the RPC service.
 */
@RemoteServiceRelativePath("tipoMatrizProductiva")
public interface TipoMatrizProductivaService extends RemoteService {
	List<String> getElementos();
	void addElemento(String tipoMatrizProductiva);
}
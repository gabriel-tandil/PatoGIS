package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.Map;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.TipoMatrizProductiva;
import ar.edu.unicen.exa.galvarez.patogis.shared.ServicioRemotoException;

import com.google.gwt.user.client.rpc.RemoteService;
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;

/**
 * The client side stub for the RPC service.
 */
@RemoteServiceRelativePath("tipoMatrizProductiva")
public interface TipoMatrizProductivaService extends RemoteService {
	Map<String, TipoMatrizProductiva> getElementos() throws ServicioRemotoException;
	void addElemento(TipoMatrizProductiva tipoMatrizProductiva) throws ServicioRemotoException;
}

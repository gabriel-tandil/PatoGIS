package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.Map;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;
import ar.edu.unicen.exa.galvarez.patogis.shared.ServicioRemotoException;

import com.google.gwt.user.client.rpc.RemoteService;
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;

/**
 * The client side stub for the RPC service.
 */
@RemoteServiceRelativePath("especies")
public interface EspeciesService extends RemoteService {
	Map<String, Especie> getElementos() throws ServicioRemotoException;
	void addElemento(Especie especie) throws ServicioRemotoException;
}

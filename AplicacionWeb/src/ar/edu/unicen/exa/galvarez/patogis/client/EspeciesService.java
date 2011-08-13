package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.List;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;

import com.google.gwt.user.client.rpc.RemoteService;
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;

/**
 * The client side stub for the RPC service.
 */
@RemoteServiceRelativePath("especies")
public interface EspeciesService extends RemoteService {
	List<Especie> getElementos();
	void addElemento(Especie especie);
}

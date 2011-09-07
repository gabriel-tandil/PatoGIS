package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.Map;

import javax.xml.rpc.ServiceException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;

import com.google.gwt.user.client.rpc.RemoteService;
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;

/**
 * The client side stub for the RPC service.
 */
@RemoteServiceRelativePath("especies")
public interface EspeciesService extends RemoteService {
	Map<String, Especie> getElementos() throws ServiceException;
	void addElemento(Especie especie) throws ServiceException;
}

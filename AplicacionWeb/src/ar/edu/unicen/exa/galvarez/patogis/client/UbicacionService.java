package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.Map;

import javax.xml.rpc.ServiceException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Ubicacion;

import com.google.gwt.user.client.rpc.RemoteService;
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;

/**
 * The client side stub for the RPC service.
 */
@RemoteServiceRelativePath("ubicacion")
public interface UbicacionService extends RemoteService {
	Map<String, Ubicacion> getElementos() throws ServiceException;
	void addElemento(Ubicacion ubicacion) throws ServiceException;
}

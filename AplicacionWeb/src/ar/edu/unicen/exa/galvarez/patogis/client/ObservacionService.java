package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.List;

import javax.xml.rpc.ServiceException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion;

import com.google.gwt.user.client.rpc.RemoteService;
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;

/**
 * The client side stub for the RPC service.
 */
@RemoteServiceRelativePath("observacion")
public interface ObservacionService extends RemoteService {
	List<Observacion> getElementos() throws ServiceException;
	void addElemento(Observacion observacion) throws ServiceException;
}

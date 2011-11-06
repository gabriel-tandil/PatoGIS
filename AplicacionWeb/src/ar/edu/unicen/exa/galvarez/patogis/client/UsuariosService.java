package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.Map;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Usuario;
import ar.edu.unicen.exa.galvarez.patogis.shared.ServicioRemotoException;

import com.google.gwt.user.client.rpc.RemoteService;
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;

/**
 * The client side stub for the RPC service.
 */
@RemoteServiceRelativePath("usuarios")
public interface UsuariosService extends RemoteService {
	Map<String, Usuario> getElementos() throws ServicioRemotoException;
	void addElemento(Usuario usuario) throws ServicioRemotoException;
}

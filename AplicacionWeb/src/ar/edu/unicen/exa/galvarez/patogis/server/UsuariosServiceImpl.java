package ar.edu.unicen.exa.galvarez.patogis.server;

import java.util.Map;

import ar.edu.unicen.exa.galvarez.patogis.client.UsuariosService;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Usuario;
import ar.edu.unicen.exa.galvarez.patogis.shared.MapaOrdenado;
import ar.edu.unicen.exa.galvarez.patogis.shared.ServicioRemotoException;

import com.google.gwt.user.server.rpc.RemoteServiceServlet;

/**
 * The server side implementation of the RPC service.
 */
@SuppressWarnings("serial")
public class UsuariosServiceImpl extends RemoteServiceServlet implements
		UsuariosService {

	public Map<String, Usuario> getElementos() throws ServicioRemotoException {
//		UsuarioWSImplServiceLocator usuarioWSServiceLocator = new UsuarioWSImplServiceLocator();
		Map<String, Usuario> l = new MapaOrdenado<String, Usuario>();
//		try {
//			UsuarioWSImpl usuarioWS = usuarioWSServiceLocator
//					.getUsuarioWSImpl();
//			Usuario[] usuarios;
//
//			usuarios = usuarioWS.getElementosConCantidadObs();
//
//			for (int i = 0; i < usuarios.length; i++) {
//				l.put(usuarios[i].getNombre(), usuarios[i]);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new ServicioRemotoException();
//
//		}

		return l;
	}

	@Override
	public void addElemento(Usuario usuario) throws ServicioRemotoException {
//		UsuarioWSImplServiceLocator usuarioWSServiceLocator = new UsuarioWSImplServiceLocator();
//
//		try {
//
//			UsuarioWSImpl usuarioWS = usuarioWSServiceLocator
//					.getUsuarioWSImpl();
//
//			usuarioWS.addElemento(usuario, 1);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new ServicioRemotoException();
//		}
	}

}

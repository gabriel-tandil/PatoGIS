package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.Map;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Usuario;
import ar.edu.unicen.exa.galvarez.patogis.shared.ServicioRemotoException;

import com.google.gwt.user.client.rpc.AsyncCallback;

/**
 * The async counterpart of <code>UsuariosService</code>.
 */
public interface UsuariosServiceAsync {
	void getElementos(AsyncCallback<Map<String, Usuario>> asyncCallback);

	void addElemento(Usuario usuario, AsyncCallback<Void> callback);
	
	void  obtenerUsuario(String usuario, String clave,AsyncCallback<Usuario> callback);
}

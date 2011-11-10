package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices;

import java.rmi.Remote;
import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Usuario;

public interface UsuarioWS extends Remote {

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	public Usuario[] getElementos() throws RemoteException;

	public void addElemento(Usuario elemento, Integer idUsuario)
			throws RemoteException;

	void editElemento(Usuario elemento, Integer idUsuario)
			throws RemoteException;

	Usuario obtenerUsuario(String usuario, String clave) throws RemoteException;;
}

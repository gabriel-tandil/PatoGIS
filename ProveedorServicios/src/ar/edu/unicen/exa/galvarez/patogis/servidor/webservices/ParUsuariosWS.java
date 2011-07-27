package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices;

import java.rmi.Remote;
import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ParUsuarios;

public interface ParUsuariosWS extends Remote {

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	public ParUsuarios[] getElementos() throws RemoteException;

	public void addElemento(ParUsuarios elemento, Integer idUsuario)
			throws RemoteException;

}

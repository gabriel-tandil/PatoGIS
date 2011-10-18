package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices;

import java.rmi.Remote;
import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Ubicacion;

public interface UbicacionWS extends Remote {

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	public Ubicacion[] getElementos() throws RemoteException;

	public void addElemento(Ubicacion elemento, Integer idUsuario)
			throws RemoteException;

	void editElemento(Ubicacion elemento, Integer idUsuario)
			throws RemoteException;

}

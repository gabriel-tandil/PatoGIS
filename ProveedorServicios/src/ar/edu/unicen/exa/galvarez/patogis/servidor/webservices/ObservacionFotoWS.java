package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices;

import java.rmi.Remote;
import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionFoto;

public interface ObservacionFotoWS extends Remote {

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	public ObservacionFoto[] getElementos() throws RemoteException;

	public void addElemento(ObservacionFoto elemento, Integer idUsuario)
			throws RemoteException;

}

package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices;

import java.rmi.Remote;
import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionMatrizProductiva;

public interface ObservacionMatrizProductivaWS extends Remote {

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	public ObservacionMatrizProductiva[] getElementos() throws RemoteException;

	public void addElemento(ObservacionMatrizProductiva elemento,
			Integer idUsuario) throws RemoteException;

	void editElemento(ObservacionMatrizProductiva elemento, Integer idUsuario)
			throws RemoteException;

}

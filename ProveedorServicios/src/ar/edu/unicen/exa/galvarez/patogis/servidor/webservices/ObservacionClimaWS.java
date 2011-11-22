package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices;

import java.rmi.Remote;
import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionClima;

public interface ObservacionClimaWS extends Remote {

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	public ObservacionClima[] getElementos() throws RemoteException;

	public void addElemento(ObservacionClima elemento, String usuario, String clave)
			throws RemoteException;

	void editElemento(ObservacionClima elemento, String usuario, String clave)
			throws RemoteException;

}

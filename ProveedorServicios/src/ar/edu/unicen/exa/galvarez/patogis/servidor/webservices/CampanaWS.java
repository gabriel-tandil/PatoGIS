package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices;

import java.rmi.Remote;
import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Campana;

public interface CampanaWS extends Remote {

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	public Campana[] getElementos() throws RemoteException;

	public void addElemento(Campana elemento, String usuario, String clave)
			throws RemoteException;

	void editElemento(Campana elemento, String usuario, String clave)
			throws RemoteException;

}

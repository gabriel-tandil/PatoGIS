package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices;

import java.rmi.Remote;
import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;

public interface EspecieWS extends Remote {

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	public Especie[] getElementos() throws RemoteException;

	public void addElemento(Especie elemento, String usuario, String clave)
			throws RemoteException;

	public Especie[] getElementosConCantidadObs() throws RemoteException;

	void editElemento(Especie elemento, String usuario, String clave)
			throws RemoteException;
}
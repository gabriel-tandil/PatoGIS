package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices;

import java.rmi.Remote;
import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionEspecie;

public interface ObservacionEspecieWS extends Remote {

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	public ObservacionEspecie[] getElementos() throws RemoteException;

	public void addElemento(ObservacionEspecie elemento, Integer idUsuario)
			throws RemoteException;

	void editElemento(ObservacionEspecie elemento, Integer idUsuario)
			throws RemoteException;

}

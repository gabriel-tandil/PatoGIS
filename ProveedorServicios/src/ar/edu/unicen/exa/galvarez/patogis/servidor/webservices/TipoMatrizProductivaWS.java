package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices;

import java.rmi.Remote;
import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.TipoMatrizProductiva;

public interface TipoMatrizProductivaWS extends Remote {
	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	public TipoMatrizProductiva[] getElementos() throws RemoteException;

	public void addElemento(TipoMatrizProductiva elemento, Integer idUsuario)
			throws RemoteException;
	
	public TipoMatrizProductiva[] getElementosConCantidadObs() throws RemoteException;

	void editElemento(TipoMatrizProductiva elemento, Integer idUsuario)
			throws RemoteException;
}
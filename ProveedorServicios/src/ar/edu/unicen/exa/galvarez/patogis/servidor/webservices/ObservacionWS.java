package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices;

import java.rmi.Remote;
import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion;

public interface ObservacionWS extends Remote {

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	public Observacion[] getElementos() throws RemoteException;

	public void addElemento(Observacion elemento, Integer idUsuario)
			throws RemoteException;

}

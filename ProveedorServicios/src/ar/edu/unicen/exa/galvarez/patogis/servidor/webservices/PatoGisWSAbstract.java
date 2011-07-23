package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface PatoGisWSAbstract<T> extends Remote
{

	void addElemento(T elemento, Integer idUsuario) throws RemoteException;

	T[] getElementos() throws RemoteException;
}
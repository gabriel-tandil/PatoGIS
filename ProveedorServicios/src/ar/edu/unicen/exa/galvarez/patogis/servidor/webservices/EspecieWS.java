package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices;

import java.rmi.Remote;
import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;

public interface EspecieWS extends Remote {

	public Especie[] getEspecies() throws RemoteException;

	public void addEspecie(Especie especie) throws RemoteException;

}
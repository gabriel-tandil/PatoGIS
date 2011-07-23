package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.EspecieWS;

public class EspecieWSImpl extends PatoGisWSAbstractImpl<Especie> implements
		EspecieWS {
	
	public EspecieWSImpl() {
		super(Especie.class);
	}

	
	//los metodos getElementos y addElemento se redefinen aca invocando al del padre porque la refinicion del web service asi lo requiere
	public Especie[] getElementos() throws RemoteException {
		return super.getElementosGenerico();
	}

	public void addElemento(Especie elemento, Integer idUsuario)
			throws RemoteException {
		super.addElementoGenerico(elemento, idUsuario);
	}
}
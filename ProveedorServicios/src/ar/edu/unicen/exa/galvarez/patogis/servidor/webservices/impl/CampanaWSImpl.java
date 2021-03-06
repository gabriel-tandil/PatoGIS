package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Campana;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.CampanaWS;

public class CampanaWSImpl extends PatoGisWSAbstractImpl<Campana> implements
		CampanaWS {
	public CampanaWSImpl() {
		super(Campana.class);
	}

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	@Override
	public Campana[] getElementos() throws RemoteException {
		return super.getElementosGenerico();

	}

	@Override
	public void addElemento(Campana elemento, String usuario, String clave)
			throws RemoteException {
		super.addElementoGenerico(elemento, usuario, clave);
	}

	@Override
	public void editElemento(Campana elemento, String usuario, String clave)
			throws RemoteException {
		super.editElementoGenerico(elemento, usuario, clave);
	}
}

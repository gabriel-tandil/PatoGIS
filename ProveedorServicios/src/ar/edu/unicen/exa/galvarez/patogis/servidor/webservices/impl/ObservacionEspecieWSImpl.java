package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionEspecie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.ObservacionEspecieWS;

public class ObservacionEspecieWSImpl extends
		PatoGisWSAbstractImpl<ObservacionEspecie> implements
		ObservacionEspecieWS {
	public ObservacionEspecieWSImpl() {
		super(ObservacionEspecie.class);
	}

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	@Override
	public ObservacionEspecie[] getElementos() throws RemoteException {
		return super.getElementosGenerico();

	}

	@Override
	public void addElemento(ObservacionEspecie elemento, String usuario, String clave)
			throws RemoteException {
		super.addElementoGenerico(elemento, usuario, clave);
	}
	
	@Override
	public void editElemento(ObservacionEspecie elemento, String usuario, String clave)
			throws RemoteException {
		super.editElementoGenerico(elemento, usuario, clave);
	}
}

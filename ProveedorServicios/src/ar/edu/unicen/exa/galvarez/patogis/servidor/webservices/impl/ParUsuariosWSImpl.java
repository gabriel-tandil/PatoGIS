package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ParUsuarios;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.ParUsuariosWS;

public class ParUsuariosWSImpl extends PatoGisWSAbstractImpl<ParUsuarios>
		implements ParUsuariosWS {
	public ParUsuariosWSImpl() {
		super(ParUsuarios.class);
	}

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	@Override
	public ParUsuarios[] getElementos() throws RemoteException {
		return super.getElementosGenerico();

	}

	@Override
	public void addElemento(ParUsuarios elemento, String usuario, String clave)
			throws RemoteException {
		super.addElementoGenerico(elemento, usuario, clave);
	}
	
	@Override
	public void editElemento(ParUsuarios elemento, String usuario, String clave)
			throws RemoteException {
		super.editElementoGenerico(elemento, usuario, clave);
	}
	
}

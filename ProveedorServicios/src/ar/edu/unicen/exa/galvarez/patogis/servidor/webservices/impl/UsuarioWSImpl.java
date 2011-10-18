package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Usuario;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.UsuarioWS;

public class UsuarioWSImpl extends PatoGisWSAbstractImpl<Usuario> implements
		UsuarioWS {
	public UsuarioWSImpl() {
		super(Usuario.class);
	}

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	@Override
	public Usuario[] getElementos() throws RemoteException {
		return super.getElementosGenerico();

	}

	@Override
	public void addElemento(Usuario elemento, Integer idUsuario)
			throws RemoteException {
		super.addElementoGenerico(elemento, idUsuario);
	}
	
	@Override
	public void editElemento(Usuario elemento, Integer idUsuario)
			throws RemoteException {
		super.editElementoGenerico(elemento, idUsuario);
	}
}

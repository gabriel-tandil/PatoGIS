package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionFoto;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.ObservacionFotoWS;

public class ObservacionFotoWSImpl extends
		PatoGisWSAbstractImpl<ObservacionFoto> implements ObservacionFotoWS {
	public ObservacionFotoWSImpl() {
		super(ObservacionFoto.class);
	}

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	@Override
	public ObservacionFoto[] getElementos() throws RemoteException {
		return super.getElementosGenerico();

	}

	@Override
	public void addElemento(ObservacionFoto elemento, Integer idUsuario)
			throws RemoteException {
		super.addElementoGenerico(elemento, idUsuario);
	}
}

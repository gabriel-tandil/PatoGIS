package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.ObservacionWS;

public class ObservacionWSImpl extends PatoGisWSAbstractImpl<Observacion>
		implements ObservacionWS {
	public ObservacionWSImpl() {
		super(Observacion.class);
	}

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	@Override
	public Observacion[] getElementos() throws RemoteException {
		return super.getElementosGenerico();

	}

	@Override
	public void addElemento(Observacion elemento, Integer idUsuario)
			throws RemoteException {
		super.addElementoGenerico(elemento, idUsuario);
	}
}

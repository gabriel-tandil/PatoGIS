package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionClima;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.ObservacionClimaWS;

public class ObservacionClimaWSImpl extends
		PatoGisWSAbstractImpl<ObservacionClima> implements
		ObservacionClimaWS {
	public ObservacionClimaWSImpl() {
		super(ObservacionClima.class);
	}

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	@Override
	public ObservacionClima[] getElementos() throws RemoteException {
		return super.getElementosGenerico();

	}

	@Override
	public void addElemento(ObservacionClima elemento, Integer idUsuario)
			throws RemoteException {
		super.addElementoGenerico(elemento, idUsuario);
	}
}

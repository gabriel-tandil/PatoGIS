package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionMatrizProductiva;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.ObservacionMatrizProductivaWS;

public class ObservacionMatrizProductivaWSImpl extends
		PatoGisWSAbstractImpl<ObservacionMatrizProductiva> implements
		ObservacionMatrizProductivaWS {
	public ObservacionMatrizProductivaWSImpl() {
		super(ObservacionMatrizProductiva.class);
	}

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	@Override
	public ObservacionMatrizProductiva[] getElementos() throws RemoteException {
		return super.getElementosGenerico();

	}

	@Override
	public void addElemento(ObservacionMatrizProductiva elemento,
			Integer idUsuario) throws RemoteException {
		super.addElementoGenerico(elemento, idUsuario);
	}
}

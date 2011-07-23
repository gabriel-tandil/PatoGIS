package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.TipoMatrizProductiva;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.TipoMatrizProductivaWS;

public class TipoMatrizProductivaWSImpl extends
		PatoGisWSAbstractImpl<TipoMatrizProductiva> implements
		TipoMatrizProductivaWS {
	public TipoMatrizProductivaWSImpl() {
		super(TipoMatrizProductiva.class);
	}

	//los metodos getElementos y addElemento se redefinen aca invocando al del padre porque la refinicion del web service asi lo requiere
	public TipoMatrizProductiva[] getElementos() throws RemoteException {
		return super.getElementosGenerico();

	}

	public void addElemento(TipoMatrizProductiva elemento, Integer idUsuario)
			throws RemoteException {
		super.addElementoGenerico(elemento, idUsuario);
	}
}
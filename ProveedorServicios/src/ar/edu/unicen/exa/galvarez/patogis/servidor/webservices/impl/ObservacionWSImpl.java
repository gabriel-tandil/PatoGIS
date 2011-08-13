package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import java.rmi.RemoteException;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionEspecie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionFoto;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionMatrizProductiva;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.ObservacionClimaWS;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.ObservacionEspecieWS;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.ObservacionFotoWS;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.ObservacionMatrizProductivaWS;
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
		//TODO: mejorar esquema de salvado e ids padres en hijos y viceversa y separar dto y jbo
		super.addElementoGenerico(elemento, idUsuario);
		ObservacionEspecieWS oews=new ObservacionEspecieWSImpl();
		ObservacionMatrizProductivaWS ompws=new ObservacionMatrizProductivaWSImpl();
		ObservacionClimaWS ocws=new ObservacionClimaWSImpl();
		ObservacionFotoWS ofws=new ObservacionFotoWSImpl();

		for (ObservacionEspecie observacionEspecie : elemento.getObservacionesEspecie()) {
			observacionEspecie.setIdObservacion(elemento.getId());
			oews.addElemento(observacionEspecie, idUsuario);
		}
		for (ObservacionMatrizProductiva observacionMatrizProductiva : elemento.getObservacionesMatrizProductiva()) {
			observacionMatrizProductiva.setIdObservacion(elemento.getId());
			ompws.addElemento(observacionMatrizProductiva, idUsuario);
		}
		for (ObservacionFoto observacionFoto : elemento.getObservacionesFoto()) {
			observacionFoto.setIdObservacion(elemento.getId());
			ofws.addElemento(observacionFoto, idUsuario);
		}
		elemento.getObservacionClima().setIdObservacion(elemento.getId());
		ocws.addElemento(elemento.getObservacionClima(), idUsuario);
	}
}

package ar.edu.unicen.exa.galvarez.patogis.server;

import java.util.Map;

import ar.edu.unicen.exa.galvarez.patogis.client.TipoMatrizProductivaService;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.TipoMatrizProductiva;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.TipoMatrizProductivaWSImpl;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.TipoMatrizProductivaWSImplServiceLocator;
import ar.edu.unicen.exa.galvarez.patogis.shared.MapaOrdenado;
import ar.edu.unicen.exa.galvarez.patogis.shared.ServicioRemotoException;

import com.google.gwt.user.server.rpc.RemoteServiceServlet;

/**
 * The server side implementation of the RPC service.
 */
@SuppressWarnings("serial")
public class TipoMatrizProductivaServiceImpl extends RemoteServiceServlet implements
TipoMatrizProductivaService {

	public Map<String, TipoMatrizProductiva> getElementos()
			throws ServicioRemotoException {
		TipoMatrizProductivaWSImplServiceLocator tipoMatrizProductivaWSImplServiceLocator = new TipoMatrizProductivaWSImplServiceLocator();
		Map<String, TipoMatrizProductiva> l = new MapaOrdenado<String, TipoMatrizProductiva>();

		try {
			TipoMatrizProductivaWSImpl tipoMatrizProductivaWS = tipoMatrizProductivaWSImplServiceLocator
			.getTipoMatrizProductivaWSImpl();
			TipoMatrizProductiva[] tiposMatrizProductiva = tipoMatrizProductivaWS.getElementosConCantidadObs();

				for (int i = 0; i < tiposMatrizProductiva.length; i++) {
					l.put(tiposMatrizProductiva[i].getNombre(),tiposMatrizProductiva[i]);
				}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServicioRemotoException();

		}
		return l;
	}

	@Override
	public void addElemento(TipoMatrizProductiva tipoMatrizProductiva)throws ServicioRemotoException {
		TipoMatrizProductivaWSImplServiceLocator tipoMatrizProductivaWSImplServiceLocator = new TipoMatrizProductivaWSImplServiceLocator();

		try {
			TipoMatrizProductivaWSImpl tipoMatrizProductivaWS = tipoMatrizProductivaWSImplServiceLocator
					.getTipoMatrizProductivaWSImpl();
			tipoMatrizProductivaWS.addElemento(tipoMatrizProductiva,1);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServicioRemotoException();

		}
	}

}

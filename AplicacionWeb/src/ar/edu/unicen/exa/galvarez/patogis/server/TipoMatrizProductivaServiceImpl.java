package ar.edu.unicen.exa.galvarez.patogis.server;

import java.rmi.RemoteException;
import java.util.Map;

import javax.xml.rpc.ServiceException;

import ar.edu.unicen.exa.galvarez.patogis.client.TipoMatrizProductivaService;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.TipoMatrizProductiva;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.TipoMatrizProductivaWSImpl;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.TipoMatrizProductivaWSImplServiceLocator;
import ar.edu.unicen.exa.galvarez.patogis.shared.MapaOrdenado;

import com.google.gwt.user.server.rpc.RemoteServiceServlet;

/**
 * The server side implementation of the RPC service.
 */
@SuppressWarnings("serial")
public class TipoMatrizProductivaServiceImpl extends RemoteServiceServlet implements
TipoMatrizProductivaService {

	public Map<String, TipoMatrizProductiva> getElementos() throws IllegalArgumentException {
		TipoMatrizProductivaWSImplServiceLocator tipoMatrizProductivaWSImplServiceLocator = new TipoMatrizProductivaWSImplServiceLocator();
		Map<String, TipoMatrizProductiva> l = new MapaOrdenado<String, TipoMatrizProductiva>();

		try {
			TipoMatrizProductivaWSImpl tipoMatrizProductivaWS = tipoMatrizProductivaWSImplServiceLocator
			.getTipoMatrizProductivaWSImpl();
			TipoMatrizProductiva[] tiposMatrizProductiva = tipoMatrizProductivaWS.getElementos();
			if (tiposMatrizProductiva!=null){
				for (int i = 0; i < tiposMatrizProductiva.length; i++) {
					l.put(tiposMatrizProductiva[i].getNombre(),tiposMatrizProductiva[i]);
				}
			}
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return l;
	}

	@Override
	public void addElemento(TipoMatrizProductiva tipoMatrizProductiva) {
		TipoMatrizProductivaWSImplServiceLocator tipoMatrizProductivaWSImplServiceLocator = new TipoMatrizProductivaWSImplServiceLocator();

		try {
			TipoMatrizProductivaWSImpl tipoMatrizProductivaWS = tipoMatrizProductivaWSImplServiceLocator
					.getTipoMatrizProductivaWSImpl();
			tipoMatrizProductivaWS.addElemento(tipoMatrizProductiva,1);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

}

package ar.edu.unicen.exa.galvarez.patogis.server;

import java.rmi.RemoteException;
import java.util.Map;

import javax.xml.rpc.ServiceException;

import ar.edu.unicen.exa.galvarez.patogis.client.EspeciesService;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.EspecieWSImpl;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.EspecieWSImplServiceLocator;
import ar.edu.unicen.exa.galvarez.patogis.shared.MapaOrdenado;

import com.google.gwt.user.server.rpc.RemoteServiceServlet;

/**
 * The server side implementation of the RPC service.
 */
@SuppressWarnings("serial")
public class EspeciesServiceImpl extends RemoteServiceServlet implements
		EspeciesService {

	public Map<String, Especie> getElementos() throws IllegalArgumentException {
		EspecieWSImplServiceLocator especieWSServiceLocator = new EspecieWSImplServiceLocator();
		Map<String,Especie> l = new MapaOrdenado<String,Especie>();

		try {
			EspecieWSImpl especieWS = especieWSServiceLocator
					.getEspecieWSImpl();
			Especie[] especies = especieWS.getElementosConCantidadObs();
			if (especies != null) {
				
				for (int i = 0; i < especies.length; i++) {
					l.put(especies[i].getNombre(),especies[i]);
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
	public void addElemento(Especie especie) {
		EspecieWSImplServiceLocator especieWSServiceLocator = new EspecieWSImplServiceLocator();

		try {

			EspecieWSImpl especieWS = especieWSServiceLocator
					.getEspecieWSImpl();
			
			especieWS.addElemento(especie, 1);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

package ar.edu.unicen.exa.galvarez.patogis.server;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.rpc.ServiceException;

import ar.edu.unicen.exa.galvarez.patogis.client.EspeciesService;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.EspecieWSImpl;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.EspecieWSImplServiceLocator;

import com.google.gwt.user.server.rpc.RemoteServiceServlet;

/**
 * The server side implementation of the RPC service.
 */
@SuppressWarnings("serial")
public class EspeciesServiceImpl extends RemoteServiceServlet implements
		EspeciesService {

	public List<String> getElementos() throws IllegalArgumentException {
		EspecieWSImplServiceLocator especieWSServiceLocator = new EspecieWSImplServiceLocator();
		List<String> l = new ArrayList<String>();

		try {
			EspecieWSImpl especieWS = especieWSServiceLocator
					.getEspecieWSImpl();
			Especie[] especies = especieWS.getElementos();
			if (especies != null) {
				for (int i = 0; i < especies.length; i++) {
					l.add(especies[i].getNombre());
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
	public void addElemento(String especie) {
		EspecieWSImplServiceLocator especieWSServiceLocator = new EspecieWSImplServiceLocator();

		try {

			EspecieWSImpl especieWS = especieWSServiceLocator
					.getEspecieWSImpl();
			Especie e = new Especie();
			e.setNombre(especie);
			especieWS.addElemento(e, 1);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

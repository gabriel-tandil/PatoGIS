package ar.edu.unicen.exa.galvarez.patogis.server;

import java.util.Map;

import ar.edu.unicen.exa.galvarez.patogis.client.EspeciesService;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.EspecieWSImpl;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.EspecieWSImplServiceLocator;
import ar.edu.unicen.exa.galvarez.patogis.shared.MapaOrdenado;
import ar.edu.unicen.exa.galvarez.patogis.shared.ServicioRemotoException;

import com.google.gwt.user.server.rpc.RemoteServiceServlet;

/**
 * The server side implementation of the RPC service.
 */
@SuppressWarnings("serial")
public class EspeciesServiceImpl extends RemoteServiceServlet implements
		EspeciesService {

	public Map<String, Especie> getElementos() throws ServicioRemotoException {
		EspecieWSImplServiceLocator especieWSServiceLocator = new EspecieWSImplServiceLocator();
		Map<String, Especie> l = new MapaOrdenado<String, Especie>();
		try {
			EspecieWSImpl especieWS = especieWSServiceLocator
					.getEspecieWSImpl();
			Especie[] especies;

			especies = especieWS.getElementosConCantidadObs();

			for (int i = 0; i < especies.length; i++) {
				l.put(especies[i].getNombre(), especies[i]);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServicioRemotoException();

		}

		return l;
	}

	@Override
	public void addElemento(Especie especie, String usuario, String clave)
			throws ServicioRemotoException {
		EspecieWSImplServiceLocator especieWSServiceLocator = new EspecieWSImplServiceLocator();

		try {

			EspecieWSImpl especieWS = especieWSServiceLocator
					.getEspecieWSImpl();

			especieWS.addElemento(especie, usuario, clave);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServicioRemotoException();
		}
	}

}

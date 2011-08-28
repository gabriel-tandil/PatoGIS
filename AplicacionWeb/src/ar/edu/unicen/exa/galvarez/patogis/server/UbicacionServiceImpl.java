package ar.edu.unicen.exa.galvarez.patogis.server;

import java.rmi.RemoteException;
import java.util.Map;

import javax.xml.rpc.ServiceException;

import ar.edu.unicen.exa.galvarez.patogis.client.UbicacionService;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Ubicacion;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.UbicacionWSImpl;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.UbicacionWSImplServiceLocator;
import ar.edu.unicen.exa.galvarez.patogis.shared.MapaOrdenado;

import com.google.gwt.user.server.rpc.RemoteServiceServlet;

/**
 * The server side implementation of the RPC service.
 */
@SuppressWarnings("serial")
public class UbicacionServiceImpl extends RemoteServiceServlet implements
UbicacionService {

	public Map<String, Ubicacion> getElementos() throws IllegalArgumentException {
		UbicacionWSImplServiceLocator UbicacionWSImplServiceLocator = new UbicacionWSImplServiceLocator();
		Map<String, Ubicacion> l = new MapaOrdenado<String, Ubicacion>();

		try {
			UbicacionWSImpl UbicacionWS = UbicacionWSImplServiceLocator
			.getUbicacionWSImpl();
			Ubicacion[] ubicaciones = UbicacionWS.getElementos();
			if (ubicaciones!=null){
				for (int i = 0; i < ubicaciones.length; i++) {
					l.put(ubicaciones[i].getNombre(),ubicaciones[i]);
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
	public void addElemento(Ubicacion ubicacion) {
		UbicacionWSImplServiceLocator UbicacionWSImplServiceLocator = new UbicacionWSImplServiceLocator();

		try {

			UbicacionWSImpl UbicacionWS = UbicacionWSImplServiceLocator
					.getUbicacionWSImpl();
			UbicacionWS.addElemento(ubicacion,1);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

}

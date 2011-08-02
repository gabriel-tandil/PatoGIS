package ar.edu.unicen.exa.galvarez.patogis.server;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.rpc.ServiceException;

import ar.edu.unicen.exa.galvarez.patogis.client.UbicacionService;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Ubicacion;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.UbicacionWSImpl;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.UbicacionWSImplServiceLocator;

import com.google.gwt.user.server.rpc.RemoteServiceServlet;

/**
 * The server side implementation of the RPC service.
 */
@SuppressWarnings("serial")
public class UbicacionServiceImpl extends RemoteServiceServlet implements
UbicacionService {

	public List<String> getElementos() throws IllegalArgumentException {
		UbicacionWSImplServiceLocator UbicacionWSImplServiceLocator = new UbicacionWSImplServiceLocator();
		List<String> l = new ArrayList<String>();

		try {
			UbicacionWSImpl UbicacionWS = UbicacionWSImplServiceLocator
			.getUbicacionWSImpl();
			Ubicacion[] ubicaciones = UbicacionWS.getElementos();
			if (ubicaciones!=null){
				for (int i = 0; i < ubicaciones.length; i++) {
					l.add(ubicaciones[i].getNombre());
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
	public void addElemento(String ubicacion) {
		UbicacionWSImplServiceLocator UbicacionWSImplServiceLocator = new UbicacionWSImplServiceLocator();

		try {

			UbicacionWSImpl UbicacionWS = UbicacionWSImplServiceLocator
					.getUbicacionWSImpl();
			Ubicacion t=new Ubicacion();
			t.setNombre(ubicacion);
			UbicacionWS.addElemento(t,1);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

}

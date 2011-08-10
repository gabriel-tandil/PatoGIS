package ar.edu.unicen.exa.galvarez.patogis.server;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.xml.rpc.ServiceException;

import ar.edu.unicen.exa.galvarez.patogis.client.ObservacionService;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.ObservacionWSImpl;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.ObservacionWSImplServiceLocator;

import com.google.gwt.user.server.rpc.RemoteServiceServlet;

/**
 * The server side implementation of the RPC service.
 */
@SuppressWarnings("serial")
public class ObservacionServiceImpl extends RemoteServiceServlet implements
ObservacionService {

	public List<Observacion> getElementos() throws IllegalArgumentException {
		ObservacionWSImplServiceLocator ObservacionWSImplServiceLocator = new ObservacionWSImplServiceLocator();
		List<Observacion> l = new ArrayList<Observacion>() ;

		try {
			ObservacionWSImpl ObservacionWS = ObservacionWSImplServiceLocator
			.getObservacionWSImpl();
			Observacion[] observaciones = ObservacionWS.getElementos();
			if (observaciones!=null){
l=Arrays.asList(observaciones);
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
	public void addElemento(Observacion observacion) {
		ObservacionWSImplServiceLocator ObservacionWSImplServiceLocator = new ObservacionWSImplServiceLocator();

		try {

			ObservacionWSImpl ObservacionWS = ObservacionWSImplServiceLocator
					.getObservacionWSImpl();

			ObservacionWS.addElemento(observacion,1);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

}

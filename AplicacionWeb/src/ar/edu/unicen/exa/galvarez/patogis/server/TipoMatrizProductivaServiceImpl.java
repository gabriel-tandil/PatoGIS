package ar.edu.unicen.exa.galvarez.patogis.server;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.rpc.ServiceException;

import ar.edu.unicen.exa.galvarez.patogis.client.TipoMatrizProductivaService;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.TipoMatrizProductiva;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.TipoMatrizProductivaWSImpl;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.TipoMatrizProductivaWSImplServiceLocator;

import com.google.gwt.user.server.rpc.RemoteServiceServlet;

/**
 * The server side implementation of the RPC service.
 */
@SuppressWarnings("serial")
public class TipoMatrizProductivaServiceImpl extends RemoteServiceServlet implements
TipoMatrizProductivaService {

	public List<String> getElementos() throws IllegalArgumentException {

		TipoMatrizProductivaWSImplServiceLocator tipoMatrizProductivaWSImplServiceLocator = new TipoMatrizProductivaWSImplServiceLocator();

		try {
			List<String> l = new ArrayList<String>();
			TipoMatrizProductivaWSImpl tipoMatrizProductivaWS = tipoMatrizProductivaWSImplServiceLocator
			.getTipoMatrizProductivaWSImpl();
			TipoMatrizProductiva[] tiposMatrizProductiva = tipoMatrizProductivaWS.getElementos();
			if (tiposMatrizProductiva!=null){
			for (int i = 0; i < tiposMatrizProductiva.length; i++) {
				l.add(tiposMatrizProductiva[i].getNombre());
			}}
			return l;
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}

	@Override
	public void addElemento(String tipoMatrizProductiva) {
		TipoMatrizProductivaWSImplServiceLocator tipoMatrizProductivaWSImplServiceLocator = new TipoMatrizProductivaWSImplServiceLocator();

		try {

			TipoMatrizProductivaWSImpl tipoMatrizProductivaWS = tipoMatrizProductivaWSImplServiceLocator
					.getTipoMatrizProductivaWSImpl();
			TipoMatrizProductiva t=new TipoMatrizProductiva();
			t.setNombre(tipoMatrizProductiva);
			tipoMatrizProductivaWS.addElemento(t,1);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

}

package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import java.rmi.RemoteException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ar.edu.unicen.exa.galvarez.patogis.servidor.logica.TipoMatrizProductivaMapper;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.TipoMatrizProductiva;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.TipoMatrizProductivaWS;

public class TipoMatrizProductivaWSImpl extends
		PatoGisWSAbstractImpl<TipoMatrizProductiva> implements
		TipoMatrizProductivaWS {
	public TipoMatrizProductivaWSImpl() {
		super(TipoMatrizProductiva.class);
	}

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	@Override
	public TipoMatrizProductiva[] getElementos() throws RemoteException {
		return super.getElementosGenerico();

	}

	@Override
	public void addElemento(TipoMatrizProductiva elemento, String usuario, String clave)
			throws RemoteException {
		super.addElementoGenerico(elemento, usuario, clave);
	}
	
	@Override
	public void editElemento(TipoMatrizProductiva elemento, String usuario, String clave)
			throws RemoteException {
		super.editElementoGenerico(elemento, usuario, clave);
	}	
	
	@Override
	public TipoMatrizProductiva[] getElementosConCantidadObs() throws RemoteException {
		SqlSession sqlSession = null;
		TipoMatrizProductiva[] resultado =null;
		try {
			sqlSession = obtenerSesion();
			TipoMatrizProductivaMapper oem = sqlSession
		.getMapper(TipoMatrizProductivaMapper.class);
		List<TipoMatrizProductiva> loe=oem.selectConCantidadObs();
		resultado= loe.toArray(new TipoMatrizProductiva[loe.size()]);
		} catch (Exception e) {

			e.printStackTrace();
			throw new RemoteException();
		} finally {
			sqlSession.close();
		}
		return resultado;
	}
}
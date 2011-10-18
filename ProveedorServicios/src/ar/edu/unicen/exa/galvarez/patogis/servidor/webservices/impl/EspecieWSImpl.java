package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import java.rmi.RemoteException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ar.edu.unicen.exa.galvarez.patogis.servidor.logica.EspecieMapper;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.EspecieWS;

public class EspecieWSImpl extends PatoGisWSAbstractImpl<Especie> implements
		EspecieWS {
	public EspecieWSImpl() {
		super(Especie.class);
	}

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	@Override
	public Especie[] getElementos() throws RemoteException {
		return super.getElementosGenerico();

	}

	@Override
	public void addElemento(Especie elemento, Integer idUsuario)
			throws RemoteException {
		super.addElementoGenerico(elemento, idUsuario);
	}
	
	@Override
	public void editElemento(Especie elemento, Integer idUsuario)
			throws RemoteException {
		super.editElementoGenerico(elemento, idUsuario);
	}	
	
	@Override
	public Especie[] getElementosConCantidadObs() throws RemoteException {
		SqlSession sqlSession = null;
		Especie[] resultado =null;
		try {
			sqlSession = obtenerSesion();
		EspecieMapper oem = sqlSession
		.getMapper(EspecieMapper.class);
		List<Especie> loe=oem.selectConCantidadObs();
		resultado= loe.toArray(new Especie[loe.size()]);
		} catch (Exception e) {

			e.printStackTrace();
			throw new RemoteException();
		} finally {
			sqlSession.close();
		}
		return resultado;
	}
}

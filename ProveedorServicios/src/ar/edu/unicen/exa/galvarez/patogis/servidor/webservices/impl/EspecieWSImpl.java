package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import java.rmi.RemoteException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ar.edu.unicen.exa.galvarez.patogis.servidor.logica.EspecieMapper;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.EspecieExample;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.EspecieWS;

public class EspecieWSImpl extends PatoGisWSAbstractImpl<Especie> implements EspecieWS {

	public Especie[] getEspecies() throws RemoteException {
		SqlSession sqlSession = null;
		try {
			sqlSession = obtenerSesion();
			EspecieExample especieExample = new EspecieExample();

			EspecieMapper mapper = sqlSession.getMapper(EspecieMapper.class);

			List<Especie> allRecords = mapper.selectByExample(especieExample);

			return (Especie[]) allRecords.toArray(new Especie[0]);
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;

	}

	public void addEspecie(Especie especie) throws RemoteException {
		SqlSession sqlSession = null;
		try {
			int idUsuario=1;
			sqlSession = obtenerSesionAuditada(idUsuario);
			EspecieMapper mapper = sqlSession.getMapper(EspecieMapper.class);
			mapper.insertSelective(especie);
			liberarSesionAuditada(sqlSession);
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

	}

	@Override
	public void addElemento(Especie elemento, Integer idUsuario)
			throws RemoteException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Especie[] getElementos() throws RemoteException {
		// TODO Auto-generated method stub
		return null;
	}

}
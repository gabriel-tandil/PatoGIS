package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import java.io.IOException;
import java.lang.reflect.Array;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ar.edu.unicen.exa.galvarez.patogis.servidor.logica.EspecieMapper;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.EspecieExample;
import ar.edu.unicen.exa.galvarez.patogis.servidor.util.AuditoriaUtil;
import ar.edu.unicen.exa.galvarez.patogis.servidor.util.SqlConnection;

public abstract class PatoGisWSAbstract<T> {

	public PatoGisWSAbstract() {
		super();
	}

	protected SqlSession obtenerSesion() throws IOException {
		SqlSession sqlSession;
		sqlSession = SqlConnection.getSessionFactory().openSession();
		return sqlSession;
	}

	protected void liberarSesionAuditada(SqlSession sqlSession)
			throws SQLException {
		AuditoriaUtil.desEstablecerUsuarioAuditoria(sqlSession);
		sqlSession.commit();
	}

	protected SqlSession obtenerSesionAuditada(int idUsuario)
			throws IOException, SQLException {
		SqlSession sqlSession;
		sqlSession = obtenerSesion();
		Connection c = sqlSession.getConnection();
		c.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
		c.setAutoCommit(false);
		AuditoriaUtil.establecerUsuarioAuditoria(sqlSession, idUsuario);
		return sqlSession;
	}

	
	
	public List<T> getElementos(Class<T> clase) throws RemoteException {
		SqlSession sqlSession = null;
		try {
			sqlSession = obtenerSesion();
			EspecieExample especieExample = new EspecieExample();

			EspecieMapper mapper = sqlSession.getMapper(EspecieMapper.class);

			List<T> allRecords = mapper.selectByExample(especieExample);

			
			return allRecords;
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
	
}
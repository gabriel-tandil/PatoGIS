package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import java.io.IOException;
import java.lang.reflect.Array;
import java.lang.reflect.Method;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ar.edu.unicen.exa.galvarez.patogis.servidor.util.AuditoriaUtil;
import ar.edu.unicen.exa.galvarez.patogis.servidor.util.PersistenciaUtil;
import ar.edu.unicen.exa.galvarez.patogis.servidor.util.SqlConnection;

public abstract class PatoGisWSAbstractImpl<T> {

	private Class<T> clazz;

	public PatoGisWSAbstractImpl(Class<T> clazz) {
		this.clazz = clazz;

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

	@SuppressWarnings("unchecked")
	protected T[] getElementosGenerico() throws RemoteException {
		SqlSession sqlSession = null;
		try {
			sqlSession = obtenerSesion();

			Class<?> exampleClass = getExampleClass();
			Class<?> mapperClass = getMapperClass();
			Object mapper = sqlSession.getMapper(mapperClass);
			Object example = exampleClass.newInstance();
			Method m = mapperClass.getDeclaredMethod("selectByExample",
					exampleClass);
			List<T> allRecords = (List<T>) m.invoke(mapper, example);

			T[] array = (T[]) Array.newInstance(clazz, allRecords.size());
			return allRecords.toArray(array);

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;

	}

	protected Class<?> getMapperClass() throws ClassNotFoundException {
		Class<?> mapperClass = PersistenciaUtil.getMapper(clazz);
		return mapperClass;
	}

	protected Class<?> getExampleClass() throws ClassNotFoundException {
		Class<?> exampleClass = PersistenciaUtil.getExample(clazz);
		return exampleClass;
	}

	protected Integer addElementoGenerico(T elemento, Integer idUsuario)
			throws RemoteException {
		SqlSession sqlSession = null;
		try {
			sqlSession = obtenerSesionAuditada(idUsuario.intValue());
			Class<?> mapperClass = getMapperClass();
			Method m = mapperClass.getDeclaredMethod("insertSelective", clazz);
			Object mapper = sqlSession.getMapper(mapperClass);
			m.invoke(mapper, elemento);
			liberarSesionAuditada(sqlSession);
			m = clazz.getDeclaredMethod("getId");
			return (Integer) m.invoke(elemento);
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;

	}

	protected Integer editElementoGenerico(T elemento, Integer idUsuario)
			throws RemoteException {
		SqlSession sqlSession = null;
		try {
			sqlSession = obtenerSesionAuditada(idUsuario.intValue());
			Class<?> mapperClass = getMapperClass();
			Method m = mapperClass.getDeclaredMethod(
					"updateByPrimaryKeySelective", clazz);
			Object mapper = sqlSession.getMapper(mapperClass);
			m.invoke(mapper, elemento);
			liberarSesionAuditada(sqlSession);

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;

	}

}
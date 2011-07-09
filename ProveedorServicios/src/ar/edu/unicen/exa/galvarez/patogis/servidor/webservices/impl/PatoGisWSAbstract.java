package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import ar.edu.unicen.exa.galvarez.patogis.servidor.util.AuditoriaUtil;
import ar.edu.unicen.exa.galvarez.patogis.servidor.util.SqlConnection;

public abstract class PatoGisWSAbstract {

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

}
/**
 * 
 */
package ar.edu.unicen.exa.galvarez.patogis.servidor.util;

import java.sql.SQLException;
import java.sql.Statement;

import org.apache.ibatis.session.SqlSession;

/**
 * @author gabriel
 *
 */
public class AuditoriaUtil {

	public static void desEstablecerUsuarioAuditoria(SqlSession sqlSession) throws SQLException {
		establecerUsuarioAuditoria( sqlSession,0);
	}

	public static void establecerUsuarioAuditoria(SqlSession sqlSession,int usuario)
			throws SQLException {
		Statement st=sqlSession.getConnection().createStatement();
		st.executeUpdate("update \"auditoria\".tmp_usuario set usuario="+usuario);
	}

}

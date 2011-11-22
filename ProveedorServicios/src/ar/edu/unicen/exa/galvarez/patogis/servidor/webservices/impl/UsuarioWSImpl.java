package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import java.rmi.RemoteException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ar.edu.unicen.exa.galvarez.patogis.servidor.logica.UsuarioMapper;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Usuario;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.UsuarioExample;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.UsuarioWS;

public class UsuarioWSImpl extends PatoGisWSAbstractImpl<Usuario> implements
		UsuarioWS {
	public UsuarioWSImpl() {
		super(Usuario.class);
	}

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	@Override
	public Usuario[] getElementos() throws RemoteException {
		return super.getElementosGenerico();

	}

	@Override
	public void addElemento(Usuario elemento, String usuario, String clave)
			throws RemoteException {
		super.addElementoGenerico(elemento, usuario, clave);
	}

	@Override
	public void editElemento(Usuario elemento, String usuario, String clave)
			throws RemoteException {
		super.editElementoGenerico(elemento, usuario, clave);
	}

	@Override
	public Usuario obtenerUsuario(String usuario, String clave)
			throws RemoteException {
		SqlSession sqlSession = null;
		Usuario resultado = null;
		try {
			sqlSession = obtenerSesion();
			UsuarioMapper oem = sqlSession.getMapper(UsuarioMapper.class);
			UsuarioExample example = new UsuarioExample();
			example.createCriteria().andClaveEqualTo(clave)
					.andNombreEqualTo(usuario);
			List<Usuario> loe = oem.selectByExample(example);
			if (!loe.isEmpty())
				resultado = loe.get(0);
		} catch (Exception e) {

			e.printStackTrace();
			throw new RemoteException();
		} finally {
			sqlSession.close();
		}
		return resultado;
	}
}

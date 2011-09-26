package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import java.rmi.RemoteException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ar.edu.unicen.exa.galvarez.patogis.servidor.logica.EspecieMapper;
import ar.edu.unicen.exa.galvarez.patogis.servidor.logica.ObservacionClimaMapper;
import ar.edu.unicen.exa.galvarez.patogis.servidor.logica.ObservacionEspecieMapper;
import ar.edu.unicen.exa.galvarez.patogis.servidor.logica.ObservacionFotoMapper;
import ar.edu.unicen.exa.galvarez.patogis.servidor.logica.ObservacionMapper;
import ar.edu.unicen.exa.galvarez.patogis.servidor.logica.ObservacionMatrizProductivaMapper;
import ar.edu.unicen.exa.galvarez.patogis.servidor.logica.UbicacionMapper;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionClima;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionClimaExample;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionEspecie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionEspecieExample;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionExample;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionFoto;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionFotoExample;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionMatrizProductiva;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionMatrizProductivaExample;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Ubicacion;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.ObservacionClimaWS;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.ObservacionEspecieWS;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.ObservacionFotoWS;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.ObservacionMatrizProductivaWS;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.ObservacionWS;

public class ObservacionWSImpl extends PatoGisWSAbstractImpl<Observacion>
		implements ObservacionWS {
	public ObservacionWSImpl() {
		super(Observacion.class);
	}

	// los metodos getElementos y addElemento se redefinen aca invocando al del
	// padre porque la refinicion del web service asi lo requiere
	@Override
	public Observacion[] getElementos() throws RemoteException {

		Observacion[] resultado = super.getElementosGenerico();
		SqlSession sqlSession = null;
		try {
			sqlSession = obtenerSesion();
			for (Observacion observacion : resultado) {
				ObservacionEspecieExample oee = new ObservacionEspecieExample();
				oee.createCriteria().andIdObservacionEqualTo(
						observacion.getId());
				ObservacionEspecieMapper oem = sqlSession
						.getMapper(ObservacionEspecieMapper.class);
				List<ObservacionEspecie> loe = oem.selectByExample(oee);
				for (ObservacionEspecie observacionEspecie : loe) {
					EspecieMapper em = sqlSession
							.getMapper(EspecieMapper.class);
					Especie especie = em.selectByPrimaryKey(observacionEspecie
							.getIdEspecie());
					observacionEspecie.setEspecie(especie);
					
				}
				observacion.setObservacionesEspecie(loe.toArray(new ObservacionEspecie[loe.size()]));
				ObservacionFotoExample ofe = new ObservacionFotoExample();
				oee.createCriteria().andIdObservacionEqualTo(
						observacion.getId());
				ObservacionFotoMapper ofm = sqlSession
						.getMapper(ObservacionFotoMapper.class);
				List<ObservacionFoto> lof = ofm.selectByExample(ofe);
				observacion.setObservacionesFoto(lof.toArray(new ObservacionFoto[lof.size()]));
				

				ObservacionMatrizProductivaExample ompe = new ObservacionMatrizProductivaExample();
				ompe.createCriteria().andIdObservacionEqualTo(
						observacion.getId());
				ObservacionMatrizProductivaMapper ompm = sqlSession
						.getMapper(ObservacionMatrizProductivaMapper.class);
				List<ObservacionMatrizProductiva> lomp = ompm
						.selectByExample(ompe);
				observacion.setObservacionesMatrizProductiva(lomp.toArray(new ObservacionMatrizProductiva[lomp.size()]));
				

				ObservacionClimaExample oce = new ObservacionClimaExample();
				oce.createCriteria().andIdObservacionEqualTo(
						observacion.getId());
				ObservacionClimaMapper ocm = sqlSession
						.getMapper(ObservacionClimaMapper.class);
				List<ObservacionClima> loc = ocm.selectByExample(oce);
				if (loc.size()!=0)
					observacion.setObservacionClima(loc.get(0));
				

				UbicacionMapper um = sqlSession
						.getMapper(UbicacionMapper.class);
				Ubicacion u = um.selectByPrimaryKey(observacion
						.getIdUbicacion());
				observacion.setUbicacion(u);

			}
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return resultado;

	}

	@Override
	public void addElemento(Observacion elemento, Integer idUsuario)
			throws RemoteException {
		// TODO: mejorar esquema de salvado e ids padres en hijos y viceversa y
		// separar dto y jbo
		super.addElementoGenerico(elemento, idUsuario);
		
		ObservacionExample oe = new ObservacionExample();
		oe.createCriteria().andInicioEqualTo(elemento.getInicio()).andFinEqualTo(elemento.getFin());
		oe.setOrderByClause("id desc");
		
		SqlSession sqlSession = null;
		try {
			sqlSession = obtenerSesion();				
		ObservacionMapper om = sqlSession
				.getMapper(ObservacionMapper.class);
		List<Observacion> lo = om.selectByExample(oe);
		elemento.setId(lo.get(0).getId());
		
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		ObservacionEspecieWS oews = new ObservacionEspecieWSImpl();
		ObservacionMatrizProductivaWS ompws = new ObservacionMatrizProductivaWSImpl();
		ObservacionClimaWS ocws = new ObservacionClimaWSImpl();
		ObservacionFotoWS ofws = new ObservacionFotoWSImpl();

		for (ObservacionEspecie observacionEspecie : elemento
				.getObservacionesEspecie()) {
			observacionEspecie.setIdObservacion(elemento.getId());
			oews.addElemento(observacionEspecie, idUsuario);
		}
		for (ObservacionMatrizProductiva observacionMatrizProductiva : elemento
				.getObservacionesMatrizProductiva()) {
			observacionMatrizProductiva.setIdObservacion(elemento.getId());
			ompws.addElemento(observacionMatrizProductiva, idUsuario);
		}
		for (ObservacionFoto observacionFoto : elemento.getObservacionesFoto()) {
			observacionFoto.setIdObservacion(elemento.getId());
			ofws.addElemento(observacionFoto, idUsuario);
		}
		elemento.getObservacionClima().setIdObservacion(elemento.getId());
		ocws.addElemento(elemento.getObservacionClima(), idUsuario);
	}
}

package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionClima;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionEspecie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionFoto;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionMatrizProductiva;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.TipoMatrizProductiva;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Ubicacion;
import ar.edu.unicen.exa.galvarez.patogis.shared.MapaOrdenado;

import com.google.gwt.core.client.GWT;
import com.google.gwt.i18n.client.DateTimeFormat;
import com.google.gwt.json.client.JSONArray;
import com.google.gwt.json.client.JSONBoolean;
import com.google.gwt.json.client.JSONNumber;
import com.google.gwt.json.client.JSONObject;
import com.google.gwt.json.client.JSONParser;
import com.google.gwt.json.client.JSONString;
import com.google.gwt.safehtml.shared.SafeHtml;
import com.google.gwt.storage.client.Storage;
import com.google.gwt.storage.client.StorageMap;
import com.google.gwt.user.client.rpc.AsyncCallback;

public class ManejadorAlmacenamientoLocal {
	private static StorageMap storage = new StorageMap(
			Storage.getLocalStorageIfSupported());
	final static ObservacionServiceAsync observacionService = GWT
			.create(ObservacionService.class);
	final static EspeciesServiceAsync especiesService = GWT
			.create(EspeciesService.class);
	final static TipoMatrizProductivaServiceAsync tipoMatrizProductivaService = GWT
			.create(TipoMatrizProductivaService.class);
	final static UbicacionServiceAsync ubicacionService = GWT
			.create(UbicacionService.class);

	public static void eliminarObservacionesLocales() {
		int cantidadObservacionesPersistidas = getCantidadObservacionesPersistidas();
		for (int i = 0; i < cantidadObservacionesPersistidas; i++) {
			storage.remove("observacion" + i);
		}
		setCantidadObservacionesPersistidas(0);
	}

	public static void guardarLocalMapaTiposMatrizProductiva(
			MapaOrdenado<String, TipoMatrizProductiva> tiposMatrizProductiva) {

		JSONArray arreglo = new JSONArray();
		int i = 0;
		for (Iterator<String> iterator = tiposMatrizProductiva.keySet()
				.iterator(); iterator.hasNext();) {
			String clave = iterator.next();
			TipoMatrizProductiva tipoMatrizProductiva = tiposMatrizProductiva
					.get(clave);
			JSONObject elemento = tipoMatrizProductivaAJSON(clave,
					tipoMatrizProductiva);

			arreglo.set(i, elemento);
			i++;
		}
		storage.put("mapaTiposMatrizProductiva", arreglo.toString());
	}

	private static JSONObject tipoMatrizProductivaAJSON(String clave,
			TipoMatrizProductiva tipoMatrizProductiva) {
		JSONObject elemento = new JSONObject();
		elemento.put("clave", new JSONString(clave));
		JSONObject valor = new JSONObject();
		valor.put("id", new JSONNumber(tipoMatrizProductiva.getId()));
		valor.put("nombre", new JSONString(tipoMatrizProductiva.getNombre()));
		elemento.put("valor", valor);
		return elemento;
	}

	public static MapaOrdenado<String, TipoMatrizProductiva> obtenerMapaTiposMatrizProductiva() {
		MapaOrdenado<String, TipoMatrizProductiva> salida = new MapaOrdenado<String, TipoMatrizProductiva>();
		String cadenaMapaTiposMatrizProductiva = storage
				.get("mapaTiposMatrizProductiva");
		if (cadenaMapaTiposMatrizProductiva != null) {
			JSONArray arreglo = (JSONArray) JSONParser
					.parseStrict(cadenaMapaTiposMatrizProductiva);
			for (int i = 0; i < arreglo.size(); i++) {
				JSONObject elemento = (JSONObject) arreglo.get(i);
				String clave = ((JSONString) elemento.get("clave"))
						.stringValue();
				JSONObject valor = (JSONObject) elemento.get("valor");
				TipoMatrizProductiva tipoMatrizProductiva = jSONATipoMatrizProductiva(valor);
				salida.put(clave, tipoMatrizProductiva);
			}
		}
		return salida;
	}

	private static TipoMatrizProductiva jSONATipoMatrizProductiva(
			JSONObject valor) {
		TipoMatrizProductiva tipoMatrizProductiva = new TipoMatrizProductiva();

		tipoMatrizProductiva.setId((int) ((JSONNumber) valor.get("id"))
				.doubleValue());
		tipoMatrizProductiva.setNombre(((JSONString) valor.get("nombre"))
				.stringValue());
		return tipoMatrizProductiva;
	}

	public static void guardarLocalMapaUbicacions(
			MapaOrdenado<String, Ubicacion> ubicacions) {

		JSONArray arreglo = new JSONArray();
		int i = 0;
		for (Iterator<String> iterator = ubicacions.keySet().iterator(); iterator
				.hasNext();) {
			String clave = iterator.next();
			Ubicacion ubicacion = ubicacions.get(clave);
			JSONObject elemento = ubicacionAJSON(clave, ubicacion);

			arreglo.set(i, elemento);
			i++;
		}
		storage.put("mapaUbicacions", arreglo.toString());
	}

	private static JSONObject ubicacionAJSON(String clave, Ubicacion ubicacion) {
		JSONObject elemento = new JSONObject();
		elemento.put("clave", new JSONString(clave));
		JSONObject valor = new JSONObject();
		valor.put("id", new JSONNumber(ubicacion.getId()));
		valor.put("nombre", new JSONString(ubicacion.getNombre()));
		valor.put("altura", new JSONNumber(ubicacion.getAltura() == null ? 0
				: ubicacion.getAltura()));
		valor.put("coordenadas",
				new JSONString(ubicacion.getCoordenadas() == null ? ""
						: ubicacion.getCoordenadas()));
		elemento.put("valor", valor);
		return elemento;
	}

	public static MapaOrdenado<String, Ubicacion> obtenerMapaUbicaciones() {
		MapaOrdenado<String, Ubicacion> salida = new MapaOrdenado<String, Ubicacion>();
		String cadenaMapaUbicacions = storage.get("mapaUbicacions");
		if (cadenaMapaUbicacions != null) {
			JSONArray arreglo = (JSONArray) JSONParser
					.parseStrict(cadenaMapaUbicacions);
			for (int i = 0; i < arreglo.size(); i++) {
				JSONObject elemento = (JSONObject) arreglo.get(i);
				String clave = ((JSONString) elemento.get("clave"))
						.stringValue();
				JSONObject valor = (JSONObject) elemento.get("valor");
				Ubicacion ubicacion = jSONAUbicacion(valor);
				salida.put(clave, ubicacion);
			}
		}
		return salida;
	}

	private static Ubicacion jSONAUbicacion(JSONObject valor) {
		Ubicacion ubicacion = new Ubicacion();
		ubicacion.setId((int) ((JSONNumber) valor.get("id")).doubleValue());
		ubicacion.setAltura((int) ((JSONNumber) valor.get("altura"))
				.doubleValue());
		ubicacion.setNombre(((JSONString) valor.get("nombre")).stringValue());
		ubicacion.setCoordenadas(((JSONString) valor.get("coordenadas"))
				.stringValue());
		return ubicacion;
	}

	public static void guardarLocalMapaEspecies(
			MapaOrdenado<String, Especie> especies) {
		JSONArray arreglo = new JSONArray();
		int i = 0;
		for (Iterator<String> iterator = especies.keySet().iterator(); iterator
				.hasNext();) {
			String clave = iterator.next();
			Especie especie = especies.get(clave);
			JSONObject elemento = especieAJSON(clave, especie);

			arreglo.set(i, elemento);
			i++;
		}
		storage.put("mapaEspecies", arreglo.toString());
	}

	private static JSONObject especieAJSON(String clave, Especie especie) {
		JSONObject elemento = new JSONObject();
		elemento.put("clave", new JSONString(clave));
		JSONObject valor = new JSONObject();
		valor.put("cantidadObservaciones",
				new JSONNumber(especie.getCantidadObservaciones() == null ? 0
						: especie.getCantidadObservaciones()));
		valor.put("id", new JSONNumber(especie.getId()));
		valor.put("nombre", new JSONString(especie.getNombre()));
		valor.put("nombreCientifico",
				new JSONString(especie.getNombreCientifico()));
		valor.put("familia", new JSONString(especie.getFamilia()));
		valor.put("grupo", new JSONString(especie.getGrupo()));
		elemento.put("valor", valor);
		return elemento;
	}

	public static MapaOrdenado<String, Especie> obtenerMapaEspecies() {
		MapaOrdenado<String, Especie> salida = new MapaOrdenado<String, Especie>();
		String cadenaMapaEspecies = storage.get("mapaEspecies");
		if (cadenaMapaEspecies != null) {
			JSONArray arreglo = (JSONArray) JSONParser
					.parseStrict(cadenaMapaEspecies);
			for (int i = 0; i < arreglo.size(); i++) {
				JSONObject elemento = (JSONObject) arreglo.get(i);
				String clave = ((JSONString) elemento.get("clave"))
						.stringValue();
				JSONObject valor = (JSONObject) elemento.get("valor");
				Especie especie = jSONAEspecie(valor);
				salida.put(clave, especie);
			}
		}
		return salida;
	}

	private static Especie jSONAEspecie(JSONObject valor) {
		Especie especie = new Especie();
		especie.setCantidadObservaciones((int) ((JSONNumber) valor
				.get("cantidadObservaciones")).doubleValue());
		especie.setId((int) ((JSONNumber) valor.get("id")).doubleValue());
		especie.setFamilia(((JSONString) valor.get("familia")).stringValue());
		especie.setGrupo(((JSONString) valor.get("grupo")).stringValue());
		especie.setNombre(((JSONString) valor.get("nombre")).stringValue());
		especie.setNombreCientifico(((JSONString) valor.get("nombreCientifico"))
				.stringValue());
		return especie;
	}

	public static void guardarLocalObservacion(Observacion observacion) {
		JSONObject jo = observacionAJson(observacion);
		guardarLocalObservacionString(jo.toString());
	}

	public static void guardarLocalObservacionString(String observacion) {
		int cantidadObservacionesPersistidas = getCantidadObservacionesPersistidas();
		storage.put("observacion" + cantidadObservacionesPersistidas,
				observacion);
		setCantidadObservacionesPersistidas(cantidadObservacionesPersistidas + 1);
	}

	public static List<Observacion> obtenerObservacionesLocales(boolean completo) {
		int cantidadObservacionesPersistidas = getCantidadObservacionesPersistidas();
		List<Observacion> observaciones = new ArrayList<Observacion>(
				cantidadObservacionesPersistidas);
		for (int i = 0; i < cantidadObservacionesPersistidas; i++) {
			Observacion obs = jSONAObservacion((JSONObject) JSONParser
					.parseStrict(storage.get("observacion" + i)));
			if (completo) {
				cargarUbicacion(obs);
				cargarEspecies(obs);
				cargarTiposMatricesProductivas(obs);
			}
			observaciones.add(obs);
		}

		return observaciones;
	}

	private static void cargarTiposMatricesProductivas(Observacion obs) {

		for (ObservacionMatrizProductiva oe : obs
				.getObservacionesMatrizProductiva()) {

			Map<String, TipoMatrizProductiva> mapa = obtenerMapaTiposMatrizProductiva();
			TipoMatrizProductiva tmp = null;
			for (String clave : mapa.keySet()) {
				tmp = mapa.get(clave);
				if (tmp.getId().equals(oe.getIdTipoMatrizProductiva())) {
					oe.setTipoMatrizProductiva(tmp);
					break;
				}
			}
		}
	}

	private static void cargarEspecies(Observacion obs) {

		for (ObservacionEspecie oe : obs.getObservacionesEspecie()) {

			Map<String, Especie> mapa = obtenerMapaEspecies();
			Especie especie = null;
			for (String clave : mapa.keySet()) {
				especie = mapa.get(clave);
				if (especie.getId().equals(oe.getIdEspecie())) {
					oe.setEspecie(especie);
					break;
				}
			}
		}
	}

	private static void cargarUbicacion(Observacion obs) {
		Map<String, Ubicacion> mapa = obtenerMapaUbicaciones();
		Ubicacion ubicacion = null;
		for (String clave : mapa.keySet()) {
			ubicacion = mapa.get(clave);
			if (ubicacion.getId().equals(obs.getIdUbicacion())) {
				obs.setUbicacion(ubicacion);
				break;
			}
		}
	}

	public static int getCantidadObservacionesPersistidas() {
		String s = storage.get("cantidadObservacionesPersistidas");
		if (s == null || s == "")
			s = "0";
		int cantidadObservacionesPersistidas = Integer.parseInt(s);
		return cantidadObservacionesPersistidas;
	}

	public static JSONObject observacionAJson(Observacion obs) {
		JSONObject result = new JSONObject();
		result.put("alcance", new JSONString(obs.getAlcance()));

		result.put("estado", new JSONString(obs.getEstado()));
		result.put("fiabilidad", new JSONString(obs.getFiabilidad()));
		result.put("fin",
				new JSONString(DateTimeFormat.getFormat("yyyyMMdd hh:mm")
						.format(obs.getFin())));

		result.put("idCampana", new JSONNumber(obs.getIdCampana()));
		result.put("idUbicacion", new JSONNumber(obs.getIdUbicacion()));
		result.put("idUsuario", new JSONNumber(obs.getIdUsuario()));
		result.put("idUsuarioApoyo", new JSONNumber(obs.getIdUsuarioApoyo()));
		result.put("inicio",
				new JSONString(DateTimeFormat.getFormat("yyyyMMdd hh:mm")
						.format(obs.getInicio())));

		result.put("observaciones", new JSONString(obs.getObservaciones()));
		JSONObject observacionClima = new JSONObject();
		observacionClima.put("temperatura", new JSONNumber(obs
				.getObservacionClima().getTemperatura()));
		observacionClima.put("nubes", new JSONString(obs.getObservacionClima()
				.getNubes()));

		observacionClima.put("lluvia", JSONBoolean.getInstance((obs
				.getObservacionClima().getLluvia())));
		observacionClima.put("viento", new JSONString(obs.getObservacionClima()
				.getViento()));
		observacionClima.put("sol",
				JSONBoolean.getInstance((obs.getObservacionClima().getSol())));
		result.put("observacionClima", observacionClima);
		JSONArray observacionesEspecie = new JSONArray();
		for (int i = 0; i < obs.getObservacionesEspecie().length; i++) {
			ObservacionEspecie obsEspecie = obs.getObservacionesEspecie()[i];
			JSONObject observacionEspecie = new JSONObject();
			observacionesEspecie.set(i, observacionEspecie);
			observacionEspecie.put("idEspecie",
					new JSONNumber(obsEspecie.getIdEspecie()));
			observacionEspecie.put("cantidad",
					new JSONNumber(obsEspecie.getCantidad()));
			observacionEspecie
					.put("edad", new JSONString(obsEspecie.getEdad()));
			observacionEspecie.put("conteo",
					new JSONString(obsEspecie.getConteo()));
			observacionEspecie.put("distancia",
					new JSONString(obsEspecie.getDistancia()));
		}
		result.put("observacionesEspecie", observacionesEspecie);

		JSONArray observacionesMatrizProductiva = new JSONArray();
		for (int i = 0; i < obs.getObservacionesMatrizProductiva().length; i++) {
			ObservacionMatrizProductiva obsMatrizProductiva = obs
					.getObservacionesMatrizProductiva()[i];
			JSONObject observacionMatrizProductiva = new JSONObject();
			observacionesMatrizProductiva.set(i, observacionMatrizProductiva);
			observacionMatrizProductiva.put(
					"idTipoMatrizProductiva",
					new JSONNumber(obsMatrizProductiva
							.getIdTipoMatrizProductiva()));
			observacionMatrizProductiva.put("porcentaje", new JSONNumber(
					obsMatrizProductiva.getPorcentaje()));
		}
		result.put("observacionesMatrizProductiva",
				observacionesMatrizProductiva);
		return result;
	}

	private static Observacion jSONAObservacion(JSONObject value) {
		Observacion obs = new Observacion();

		obs.setAlcance(((JSONString) value.get("alcance")).stringValue());

		obs.setEstado(((JSONString) value.get("estado")).stringValue());
		obs.setFiabilidad(((JSONString) value.get("fiabilidad")).stringValue());
		obs.setFin(DateTimeFormat.getFormat("yyyyMMdd hh:mm").parse(
				((JSONString) value.get("fin")).stringValue()));
		obs.setIdCampana((int) ((JSONNumber) value.get("idCampana"))
				.doubleValue());
		obs.setIdUbicacion((int) ((JSONNumber) value.get("idUbicacion"))
				.doubleValue());
		obs.setIdUsuario((int) ((JSONNumber) value.get("idUsuario"))
				.doubleValue());
		obs.setIdUsuarioApoyo((int) ((JSONNumber) value.get("idUsuarioApoyo"))
				.doubleValue());
		obs.setInicio(DateTimeFormat.getFormat("yyyyMMdd hh:mm").parse(
				((JSONString) value.get("inicio")).stringValue()));
		obs.setObservaciones(((JSONString) value.get("observaciones"))
				.stringValue());
		JSONObject obsClima = (JSONObject) value.get("observacionClima");
		ObservacionClima observacionClima = new ObservacionClima();
		observacionClima.setTemperatura(((JSONNumber) obsClima
				.get("temperatura")).doubleValue());
		observacionClima.setNubes(((JSONString) obsClima.get("nubes"))
				.stringValue());
		observacionClima.setLluvia(((JSONBoolean) obsClima.get("lluvia"))
				.booleanValue());
		observacionClima.setViento(((JSONString) obsClima.get("viento"))
				.stringValue());
		observacionClima.setSol(((JSONBoolean) obsClima.get("sol"))
				.booleanValue());
		obs.setObservacionClima(observacionClima);

		JSONArray obsEspecie = (JSONArray) value.get("observacionesEspecie");
		ObservacionEspecie[] observacionesEspecie = new ObservacionEspecie[obsEspecie
				.size()];

		for (int i = 0; i < obsEspecie.size(); i++) {
			ObservacionEspecie observacionEspecie = new ObservacionEspecie();
			JSONObject obsEsp = (JSONObject) obsEspecie.get(i);
			observacionesEspecie[i] = observacionEspecie;
			observacionEspecie.setIdEspecie((int) ((JSONNumber) obsEsp
					.get("idEspecie")).doubleValue());
			observacionEspecie.setCantidad((int) ((JSONNumber) obsEsp
					.get("cantidad")).doubleValue());
			observacionEspecie.setEdad(((JSONString) obsEsp.get("edad"))
					.stringValue());
			observacionEspecie.setConteo(((JSONString) obsEsp.get("conteo"))
					.stringValue());
			observacionEspecie.setDistancia(((JSONString) obsEsp
					.get("distancia")).stringValue());
		}
		obs.setObservacionesEspecie(observacionesEspecie);

		JSONArray obsMatrizProductiva = (JSONArray) value
				.get("observacionesMatrizProductiva");
		ObservacionMatrizProductiva[] observacionesMatrizProductiva = new ObservacionMatrizProductiva[obsMatrizProductiva
				.size()];
		for (int i = 0; i < obsMatrizProductiva.size(); i++) {
			ObservacionMatrizProductiva observacionMatrizProductiva = new ObservacionMatrizProductiva();
			JSONObject obsMatProd = (JSONObject) obsMatrizProductiva.get(i);
			observacionesMatrizProductiva[i] = observacionMatrizProductiva;
			observacionMatrizProductiva
					.setIdTipoMatrizProductiva((int) ((JSONNumber) obsMatProd
							.get("idTipoMatrizProductiva")).doubleValue());
			observacionMatrizProductiva
					.setPorcentaje((int) ((JSONNumber) obsMatProd
							.get("porcentaje")).doubleValue());
		}
		obs.setObservacionesMatrizProductiva(observacionesMatrizProductiva);
		obs.setObservacionesFoto(new ObservacionFoto[0]);
		return obs;

	}

	public static void setCantidadObservacionesPersistidas(int i) {
		storage.put("cantidadObservacionesPersistidas", Integer.toString(i));
	}

	public static Integer obtenerProximoIdAlmacenamientoLocal() {
		String s = storage.get("idAlmacenamientoLocal");
		if (s == null)
			s = "0";
		Integer i = new Integer(s);
		i--;
		storage.put("idAlmacenamientoLocal", i.toString());
		return i;
	}

	public static void persistirDatosLocales() {
		persistirMapasLocales(); // este llama a persistir ubicaciones
	}

	public static void persistirMapasLocales() {
		persistirUbicacionesLocales(); // este llama en cadena a los demas
	}

	public static void persistirTiposMatrizProductivaLocales() {
		final MapaOrdenado<String, TipoMatrizProductiva> mu = obtenerMapaTiposMatrizProductiva();
		for (String clave : mu.keyList()) {
			final TipoMatrizProductiva u = mu.get(clave);
			if (u.getId() < 0) {
				final Integer idLocal = u.getId();
				u.setId(null);
				tipoMatrizProductivaService.addElemento(u,
						new AsyncCallback<Void>() {
							public void onFailure(Throwable caught) {
								AplicacionWeb.setMensajeAlerta(VentanaCarga.ctes
										.errorGuardarNuevoTipoMatrizProductiva());
							}

							@Override
							public void onSuccess(Void result) {
								tipoMatrizProductivaService
										.getElementos(new AsyncCallback<Map<String, TipoMatrizProductiva>>() {

											@Override
											public void onSuccess(
													Map<String, TipoMatrizProductiva> result) {

												TipoMatrizProductiva TipoMatrizProductivaPersistida = result
														.get(u.getNombre());
												mu.put(u.getNombre(),
														TipoMatrizProductivaPersistida);
												guardarLocalMapaTiposMatrizProductiva(mu); // actualizo
												// el
												// mapa
												// de
												// persistencia
												// local
												// para
												// que
												// tenga
												// el id
												// nuevo

												List<Observacion> observaciones = obtenerObservacionesLocales(false);
												if (observaciones.size() > 0) {

													for (int i = 0; i < observaciones
															.size(); i++) {
														Observacion observacion = observaciones
																.get(i);
														boolean modifico = false;
														for (int j = 0; j < observacion
																.getObservacionesMatrizProductiva().length; j++) {
															ObservacionMatrizProductiva omp = observacion
																	.getObservacionesMatrizProductiva()[j];
															if (omp.getIdTipoMatrizProductiva() == idLocal) {
																omp.setIdTipoMatrizProductiva(TipoMatrizProductivaPersistida
																		.getId());
																modifico = true;
															}
														}
														{
															if (modifico)
																storage.put(
																		"observacion"
																				+ i,
																		observacionAJson(
																				observacion)
																				.toString());
														}

													}
												}

												persistirTiposMatrizProductivaLocales();
											}

											@Override
											public void onFailure(
													Throwable caught) {
												AplicacionWeb
														.setMensajeAlerta(VentanaCarga.ctes
																.errorGuardarNuevoTipoMatrizProductiva());
											}
										});

							}

						});
				return; // se llama recursivamente al terminar la persistencia
						// para no atorar a la base
			}
		}
		persistirObservacionesLocales();
	}

	public static void persistirEspeciesLocales() {
		final MapaOrdenado<String, Especie> mu = obtenerMapaEspecies();
		for (String clave : mu.keyList()) {
			final Especie u = mu.get(clave);
			if (u.getId() < 0) {
				final Integer idLocal = u.getId();
				u.setId(null);
				especiesService.addElemento(u, new AsyncCallback<Void>() {
					public void onFailure(Throwable caught) {
						AplicacionWeb.setMensajeAlerta(VentanaCarga.ctes
								.errorGuardarEspecie());
					}

					@Override
					public void onSuccess(Void result) {
						especiesService
								.getElementos(new AsyncCallback<Map<String, Especie>>() {

									@Override
									public void onSuccess(
											Map<String, Especie> result) {

										Especie EspeciePersistida = result
												.get(u.getNombre());
										mu.put(u.getNombre(), EspeciePersistida);
										guardarLocalMapaEspecies(mu); // actualizo
										// el
										// mapa
										// de
										// persistencia
										// local
										// para
										// que
										// tenga
										// el id
										// nuevo

										List<Observacion> observaciones = obtenerObservacionesLocales(false);
										if (observaciones.size() > 0) {

											for (int i = 0; i < observaciones
													.size(); i++) {
												Observacion observacion = observaciones
														.get(i);
												boolean modifico = false;
												for (int j = 0; j < observacion
														.getObservacionesEspecie().length; j++) {
													ObservacionEspecie omp = observacion
															.getObservacionesEspecie()[j];
													if (omp.getIdEspecie() == idLocal) {
														omp.setIdEspecie(EspeciePersistida
																.getId());
														modifico = true;
													}
												}
												{
													if (modifico)
														storage.put(
																"observacion"
																		+ i,
																observacionAJson(
																		observacion)
																		.toString());
												}

											}
										}

										persistirEspeciesLocales();
									}

									@Override
									public void onFailure(Throwable caught) {
										AplicacionWeb
												.setMensajeAlerta(VentanaCarga.ctes
														.errorGuardarEspecie());
									}
								});

					}

				});
				return; // se llama revursivamente al terminar la persistencia
						// para no atorar a la base
			}
		}
		persistirTiposMatrizProductivaLocales();
	}

	public static void persistirUbicacionesLocales() {
		final MapaOrdenado<String, Ubicacion> mu = obtenerMapaUbicaciones();
		for (String clave : mu.keyList()) {
			final Ubicacion u = mu.get(clave);
			if (u.getId() < 0) {
				final Integer idLocal = u.getId();
				u.setId(null);
				ubicacionService.addElemento(u, new AsyncCallback<Void>() {
					public void onFailure(Throwable caught) {
						AplicacionWeb.setMensajeAlerta(VentanaCarga.ctes
								.errorGuardarNuevaUbicacion());
					}

					@Override
					public void onSuccess(Void result) {
						ubicacionService
								.getElementos(new AsyncCallback<Map<String, Ubicacion>>() {

									@Override
									public void onSuccess(
											Map<String, Ubicacion> result) {

										Ubicacion ubicacionPersistida = result
												.get(u.getNombre());
										mu.put(u.getNombre(),
												ubicacionPersistida);
										guardarLocalMapaUbicacions(mu); // actualizo
																		// el
																		// mapa
																		// de
																		// persistencia
																		// local
																		// para
																		// que
																		// tenga
																		// el id
																		// nuevo

										List<Observacion> observaciones = obtenerObservacionesLocales(false);
										if (observaciones.size() > 0) {

											for (int i = 0; i < observaciones
													.size(); i++) {
												Observacion observacion = observaciones
														.get(i);
												if (observacion
														.getIdUbicacion() == idLocal) {
													observacion
															.setIdUbicacion(ubicacionPersistida
																	.getId());
													storage.put(
															"observacion" + i,
															observacionAJson(
																	observacion)
																	.toString());
												}

											}
										}

										persistirUbicacionesLocales();
									}

									@Override
									public void onFailure(Throwable caught) {
										AplicacionWeb
												.setMensajeAlerta(VentanaCarga.ctes
														.errorGuardarNuevaUbicacion());
									}
								});

					}

				});
				return; // se llama revursivamente al terminar la persistencia
						// para no atorar a la base
			}
		}
		persistirEspeciesLocales();
	}

	public static void persistirObservacionesLocales() {
		List<Observacion> observaciones = obtenerObservacionesLocales(false);
		if (observaciones.size() > 0) {
			Observacion observacion = observaciones
					.get(observaciones.size() - 1);
			observacion.setId(null);
			observacionService.addElemento(observacion,
					new AsyncCallback<Void>() {

						@Override
						public void onFailure(Throwable caught) {
							AplicacionWeb
									.setMensajeAlerta(AplicacionWeb.constantes
											.errorGuardarObservacion());
						}

						@Override
						public void onSuccess(Void result) {
							AplicacionWeb
									.setMensajeAlerta(AplicacionWeb.constantes
											.observacionGuardada());
							setCantidadObservacionesPersistidas(getCantidadObservacionesPersistidas() - 1);
							AplicacionWeb
									.actualizarCantidadObservacionesLocales();
							persistirObservacionesLocales();
						}
					});
		}
	}

	public static void actualizarObservacion(Observacion observacion) {
		for (int i = 0; i < getCantidadObservacionesPersistidas(); i++) {
			Observacion obs = jSONAObservacion((JSONObject) JSONParser
					.parseStrict(storage.get("observacion" + i)));
			if (obs.getId().equals(observacion.getId())) {
				JSONObject jo = observacionAJson(observacion);
				storage.put("observacion" + i, jo.toString());
				break;
			}
		}
	}

	public static boolean isEspeciesAlmacenadasLocalmente() {
		final MapaOrdenado<String, Especie> mu = obtenerMapaEspecies();
		for (String clave : mu.keyList()) {
			final Especie u = mu.get(clave);
			if (u.getId() < 0)
				return true;
		}
		return false;
	}

	public static boolean isUbicacionesAlmacenadasLocalmente() {
		final MapaOrdenado<String, Ubicacion> mu = obtenerMapaUbicaciones();
		for (String clave : mu.keyList()) {
			final Ubicacion u = mu.get(clave);
			if (u.getId() < 0)
				return true;
		}
		return false;
	}

	public static boolean isTiposMatrizProductivaAlmacenadasLocalmente() {
		final MapaOrdenado<String, TipoMatrizProductiva> mu = obtenerMapaTiposMatrizProductiva();
		for (String clave : mu.keyList()) {
			final TipoMatrizProductiva u = mu.get(clave);
			if (u.getId() < 0)
				return true;
		}
		return false;
	}

	public static String getInfoBackup() {
		String salida = "Backup " + new Date() + ": /*/*/* Especies:";

		final MapaOrdenado<String, Especie> mu = obtenerMapaEspecies();
		for (String clave : mu.keyList()) {
			final Especie u = mu.get(clave);
			if (u.getId() < 0)
				salida+=especieAJSON(clave, u);
		}
		salida += "/*/*/* TiposMatrizProductiva:";
		final MapaOrdenado<String, Ubicacion> mu1 = obtenerMapaUbicaciones();
		for (String clave : mu1.keyList()) {
			final Ubicacion u = mu1.get(clave);
			if (u.getId() < 0)
				salida+=ubicacionAJSON(clave, u);
		}
		salida += "/*/*/* Ubicaciones:";
		final MapaOrdenado<String, TipoMatrizProductiva> mu2 = obtenerMapaTiposMatrizProductiva();
		for (String clave : mu2.keyList()) {
			final TipoMatrizProductiva u = mu2.get(clave);
			if (u.getId() < 0)
				salida+=tipoMatrizProductivaAJSON(clave, u);
		}
		salida += "/*/*/* Observaciones:";

		for (int i = 0; i < getCantidadObservacionesPersistidas(); i++) {
			salida += storage.get("observacion" + i) + "/*/*/*";
		}
		return salida;
	}
}

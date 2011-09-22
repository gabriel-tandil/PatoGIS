package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionClima;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionEspecie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionFoto;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionMatrizProductiva;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.TipoMatrizProductiva;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Ubicacion;
import ar.edu.unicen.exa.galvarez.patogis.shared.MapaOrdenado;

import com.google.gwt.i18n.client.DateTimeFormat;
import com.google.gwt.json.client.JSONArray;
import com.google.gwt.json.client.JSONBoolean;
import com.google.gwt.json.client.JSONNumber;
import com.google.gwt.json.client.JSONObject;
import com.google.gwt.json.client.JSONParser;
import com.google.gwt.json.client.JSONString;
import com.google.gwt.storage.client.Storage;
import com.google.gwt.storage.client.StorageMap;

public class ManejadorAlmacenamientoLocal {
	private static StorageMap storage =new StorageMap(Storage.getLocalStorageIfSupported());

	public static void eliminarObservacionesLocales(){
		int cantidadObservacionesPersistidas = getCantidadObservacionesPersistidas();
		for (int i = 0; i < cantidadObservacionesPersistidas; i++) {
			storage.remove("observacion"+i);
		}
		setCantidadObservacionesPersistidas(0);
	}
	
	public static void persistirMapaTiposMatrizProductiva(
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

	public static void persistirMapaUbicacions(
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

	public static MapaOrdenado<String, Ubicacion> obtenerMapaUbicacions() {
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

	public static void persistirMapaEspecies(
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

	public static void persistirObservacion(Observacion observacion) {
		int cantidadObservacionesPersistidas = getCantidadObservacionesPersistidas();

		JSONObject jo = observacionAJson(observacion);
		storage.put("observacion" + cantidadObservacionesPersistidas,
				jo.toString());
		setCantidadObservacionesPersistidas(cantidadObservacionesPersistidas + 1);
	}

	public static List<Observacion> obtenerObservacionesPersistidas() {
		int cantidadObservacionesPersistidas = getCantidadObservacionesPersistidas();
		List<Observacion> observaciones = new ArrayList<Observacion>(
				cantidadObservacionesPersistidas);
		for (int i = 0; i < cantidadObservacionesPersistidas; i++) {
			observaciones.add(jSONAObservacion((JSONObject) JSONParser
					.parseStrict(storage.get("observacion" + i))));
		}

		return observaciones;
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
				new JSONString(DateTimeFormat.getFormat("yyyyMMdd HH:MM")
						.format(obs.getFin())));

		result.put("idCampana", new JSONNumber(obs.getIdCampana()));
		result.put("idUbicacion", new JSONNumber(obs.getIdUbicacion()));
		result.put("idUsuario", new JSONNumber(obs.getIdUsuario()));
		result.put("idUsuarioApoyo", new JSONNumber(obs.getIdUsuarioApoyo()));
		result.put("inicio",
				new JSONString(DateTimeFormat.getFormat("yyyyMMdd HH:MM")
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
		obs.setFin(DateTimeFormat.getFormat("yyyyMMdd HH:MM").parse(
				((JSONString) value.get("fin")).stringValue()));
		obs.setIdCampana((int) ((JSONNumber) value.get("idCampana"))
				.doubleValue());
		obs.setIdUbicacion((int) ((JSONNumber) value.get("idUbicacion"))
				.doubleValue());
		obs.setIdUsuario((int) ((JSONNumber) value.get("idUsuario"))
				.doubleValue());
		obs.setIdUsuarioApoyo((int) ((JSONNumber) value.get("idUsuarioApoyo"))
				.doubleValue());
		obs.setInicio(DateTimeFormat.getFormat("yyyyMMdd HH:MM").parse(
				((JSONString) value.get("inicio")).stringValue()));
		obs.setObservaciones(((JSONString) value.get("observaciones"))
				.stringValue());
		JSONObject obsClima = (JSONObject) value.get("observacionClima");
		ObservacionClima observacionClima = new ObservacionClima();
		observacionClima.setTemperatura(((JSONNumber) obsClima.get("temperatura"))
				.doubleValue());
		observacionClima.setNubes(((JSONString) obsClima.get("nubes"))
				.stringValue());
		observacionClima.setLluvia(((JSONBoolean) obsClima.get("lluvia"))
				.booleanValue());
		observacionClima.setViento(((JSONString) obsClima.get("viento"))
				.stringValue());
		observacionClima
				.setSol(((JSONBoolean) obsClima.get("sol")).booleanValue());
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
		storage.put("cantidadObservacionesPersistidas",
				Integer.toString(i));
	}

}

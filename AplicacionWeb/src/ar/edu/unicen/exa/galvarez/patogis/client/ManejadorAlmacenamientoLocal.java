package ar.edu.unicen.exa.galvarez.patogis.client;

import java.util.Iterator;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionClima;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionEspecie;
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

public class ManejadorAlmacenamientoLocal {
	
	public static void persistirMapaTiposMatrizProductiva(MapaOrdenado<String, TipoMatrizProductiva> TiposMatrizProductiva) {
		Storage storage = Storage.getLocalStorageIfSupported();
		JSONArray arreglo = new JSONArray();
		int i = 0;
		for (Iterator<String> iterator = TiposMatrizProductiva.keySet().iterator(); iterator
				.hasNext();) {
			String clave = iterator.next();
			TipoMatrizProductiva TipoMatrizProductiva = TiposMatrizProductiva.get(clave);
			JSONObject elemento = TipoMatrizProductivaAJSON(clave, TipoMatrizProductiva);

			arreglo.set(i, elemento);
			i++;
		}
		storage.setItem("mapaTiposMatrizProductiva", arreglo.toString());
	}

	private static JSONObject TipoMatrizProductivaAJSON(String clave, TipoMatrizProductiva TipoMatrizProductiva) {
		JSONObject elemento = new JSONObject();
		elemento.put("clave", new JSONString(clave));
		JSONObject valor = new JSONObject();
		valor.put("id", new JSONNumber(TipoMatrizProductiva.getId()));
		valor.put("nombre", new JSONString(TipoMatrizProductiva.getNombre()));
		elemento.put("valor", valor);
		return elemento;
	}

	public static MapaOrdenado<String, TipoMatrizProductiva> obtenerMapaTiposMatrizProductiva() {

		Storage storage = Storage.getLocalStorageIfSupported();
		MapaOrdenado<String, TipoMatrizProductiva> salida = new MapaOrdenado<String, TipoMatrizProductiva>();
		String cadenaMapaTiposMatrizProductiva = storage.getItem("mapaTiposMatrizProductiva");
		if (cadenaMapaTiposMatrizProductiva != null) {
			JSONArray arreglo = (JSONArray) JSONParser
					.parseStrict(cadenaMapaTiposMatrizProductiva);
			for (int i = 0; i < arreglo.size(); i++) {
				JSONObject elemento = (JSONObject) arreglo.get(i);
				String clave = ((JSONString)elemento.get("clave")).stringValue();
				JSONObject valor = (JSONObject) elemento.get("valor");
				TipoMatrizProductiva TipoMatrizProductiva = jSONATipoMatrizProductiva(valor);
				salida.put(clave, TipoMatrizProductiva);
			}
		}
		return salida;
	}

	private static TipoMatrizProductiva jSONATipoMatrizProductiva(JSONObject valor) {
		TipoMatrizProductiva TipoMatrizProductiva = new TipoMatrizProductiva();

		TipoMatrizProductiva.setId((int) ((JSONNumber) valor.get("id"))
				.doubleValue());
		TipoMatrizProductiva.setNombre(((JSONString)valor.get("nombre")).stringValue());
		return TipoMatrizProductiva;
	}
	
	public static void persistirMapaUbicacions(MapaOrdenado<String, Ubicacion> Ubicacions) {
		Storage storage = Storage.getLocalStorageIfSupported();
		JSONArray arreglo = new JSONArray();
		int i = 0;
		for (Iterator<String> iterator = Ubicacions.keySet().iterator(); iterator
				.hasNext();) {
			String clave = iterator.next();
			Ubicacion Ubicacion = Ubicacions.get(clave);
			JSONObject elemento = UbicacionAJSON(clave, Ubicacion);

			arreglo.set(i, elemento);
			i++;
		}
		storage.setItem("mapaUbicacions", arreglo.toString());
	}

	private static JSONObject UbicacionAJSON(String clave, Ubicacion Ubicacion) {
		JSONObject elemento = new JSONObject();
		elemento.put("clave", new JSONString(clave));
		JSONObject valor = new JSONObject();
		valor.put("id", new JSONNumber(Ubicacion.getId()));
		valor.put("nombre", new JSONString(Ubicacion.getNombre()));
		valor.put("altura", new JSONNumber(Ubicacion.getAltura()));
		valor.put("coordenadas", new JSONString(Ubicacion.getCoordenadas()));
		elemento.put("valor", valor);
		return elemento;
	}

	public static MapaOrdenado<String, Ubicacion> obtenerMapaUbicacions() {

		Storage storage = Storage.getLocalStorageIfSupported();
		MapaOrdenado<String, Ubicacion> salida = new MapaOrdenado<String, Ubicacion>();
		String cadenaMapaUbicacions = storage.getItem("mapaUbicacions");
		if (cadenaMapaUbicacions != null) {
			JSONArray arreglo = (JSONArray) JSONParser
					.parseStrict(cadenaMapaUbicacions);
			for (int i = 0; i < arreglo.size(); i++) {
				JSONObject elemento = (JSONObject) arreglo.get(i);
				String clave = ((JSONString)elemento.get("clave")).stringValue();
				JSONObject valor = (JSONObject) elemento.get("valor");
				Ubicacion Ubicacion = jSONAUbicacion(valor);
				salida.put(clave, Ubicacion);
			}
		}
		return salida;
	}

	private static Ubicacion jSONAUbicacion(JSONObject valor) {
		Ubicacion Ubicacion = new Ubicacion();
		Ubicacion.setId((int) ((JSONNumber) valor.get("id"))
				.doubleValue());
		Ubicacion.setAltura((int) ((JSONNumber) valor.get("altura"))
				.doubleValue());
		Ubicacion.setNombre(((JSONString)valor.get("nombre")).stringValue());
		Ubicacion.setCoordenadas(((JSONString)valor.get("coordenadas"))
				.stringValue());
		return Ubicacion;
	}
	
	public static void persistirMapaEspecies(MapaOrdenado<String, Especie> especies) {
		Storage storage = Storage.getLocalStorageIfSupported();
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
		storage.setItem("mapaEspecies", arreglo.toString());
	}

	private static JSONObject especieAJSON(String clave, Especie especie) {
		JSONObject elemento = new JSONObject();
		elemento.put("clave", new JSONString(clave));
		JSONObject valor = new JSONObject();
		valor.put("cantidadObservaciones",
				new JSONNumber(
						especie.getCantidadObservaciones() == null ? 0
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

		Storage storage = Storage.getLocalStorageIfSupported();
		MapaOrdenado<String, Especie> salida = new MapaOrdenado<String, Especie>();
		String cadenaMapaEspecies = storage.getItem("mapaEspecies");
		if (cadenaMapaEspecies != null) {
			JSONArray arreglo = (JSONArray) JSONParser
					.parseStrict(cadenaMapaEspecies);
			for (int i = 0; i < arreglo.size(); i++) {
				JSONObject elemento = (JSONObject) arreglo.get(i);
				String clave = ((JSONString)elemento.get("clave")).stringValue();
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
		especie.setId((int) ((JSONNumber) valor.get("id"))
				.doubleValue());
		especie.setFamilia(((JSONString)valor.get("familia")).stringValue());
		especie.setGrupo(((JSONString)valor.get("grupo")).stringValue());
		especie.setNombre(((JSONString)valor.get("nombre")).stringValue());
		especie.setNombreCientifico(((JSONString)valor.get("nombreCientifico"))
				.stringValue());
		return especie;
	}
	
	public JSONObject observacionAJson(Observacion obs) {
		JSONObject result = new JSONObject();
		result.put("alcance", new JSONString(obs.getAlcance()));

		result.put("estado", new JSONString(obs.getEstado()));
		result.put("fiabilidad", new JSONString(obs.getFiabilidad()));
		result.put("fin",
				new JSONString(DateTimeFormat.getFormat("YYYY-MM-DD HH:MM")
						.format(obs.getFin())));

		result.put("idCampana", new JSONNumber(obs.getIdCampana()));
		result.put("idUbicacion", new JSONNumber(obs.getIdUbicacion()));
		result.put("idUsuario", new JSONNumber(obs.getIdUsuario()));
		result.put("idUsuarioApoyo", new JSONNumber(obs.getIdUsuarioApoyo()));
		result.put("inicio",
				new JSONString(DateTimeFormat.getFormat("YYYY-MM-DD HH:MM")
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
		for (int i = 0; i < obs.getObservacionesEspecie().length; i++) {
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
		result.put("observacionesTipoMatrizProductiva",
				observacionesMatrizProductiva);
		return result;
	}

	public Observacion observacionDesdeJson(JSONObject value) {
		Observacion obs = new Observacion();

		obs.setAlcance(value.get("alcance").toString());

		obs.setEstado(value.get("estado").toString());
		obs.setFiabilidad(value.get("fiabilidad").toString());
		obs.setFin(DateTimeFormat.getFormat("YYYY-MM-DD HH:MM").parse(
				value.get("fin").toString()));
		obs.setIdCampana(new Integer(value.get("idCampana").toString()));
		obs.setIdUbicacion(new Integer(value.get("idUbicacion").toString()));
		obs.setIdUsuario(new Integer(value.get("idUsuario").toString()));
		obs.setIdUsuarioApoyo(new Integer(value.get("idUsuarioApoyo")
				.toString()));
		obs.setInicio(DateTimeFormat.getFormat("YYYY-MM-DD HH:MM").parse(
				value.get("inicio").toString()));
		obs.setObservaciones(value.get("observaciones").toString());

		ObservacionClima observacionClima = new ObservacionClima();
		observacionClima.setTemperatura(new Double(value.get("temperatura")
				.toString()));
		observacionClima.setNubes(value.get("nubes").toString());
		observacionClima.setLluvia(((JSONBoolean) value.get("lluvia"))
				.booleanValue());
		observacionClima.setViento(value.get("viento").toString());
		observacionClima
				.setSol(((JSONBoolean) value.get("sol")).booleanValue());
		obs.setObservacionClima(observacionClima);
		JSONArray obsEspecie = (JSONArray) value.get("observacionesEspecie");
		ObservacionEspecie[] observacionesEspecie = new ObservacionEspecie[obsEspecie
				.size()];

		for (int i = 0; i < obsEspecie.size(); i++) {
			ObservacionEspecie observacionEspecie = new ObservacionEspecie();
			JSONObject obsEsp = (JSONObject) obsEspecie.get(i);
			observacionesEspecie[i] = observacionEspecie;
			observacionEspecie.setIdEspecie(new Integer(obsEsp.get("idEspecie")
					.toString()));
			observacionEspecie.setCantidad(new Integer(obsEsp.get("cantidad")
					.toString()));
			observacionEspecie.setEdad(obsEsp.get("edad").toString());
			observacionEspecie.setConteo(obsEsp.get("conteo").toString());
			observacionEspecie.setDistancia(obsEsp.get("distancia").toString());
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
			observacionMatrizProductiva.setIdTipoMatrizProductiva(new Integer(
					obsMatProd.get("idTipoMatrizProductiva").toString()));
			observacionMatrizProductiva.setPorcentaje(new Integer(obsMatProd
					.get("porcentaje").toString()));
		}
		obs.setObservacionesMatrizProductiva(observacionesMatrizProductiva);

		return obs;

	}	
	
}

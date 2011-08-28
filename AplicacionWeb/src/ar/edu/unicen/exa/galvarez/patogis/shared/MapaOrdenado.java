package ar.edu.unicen.exa.galvarez.patogis.shared;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MapaOrdenado<K, V> extends HashMap<K, V> implements Map<K, V> {
	/**
	 * 
	 */
	private static final long serialVersionUID = -365475793500699378L;
	List<K> claves;

	public MapaOrdenado() {
		claves = new ArrayList<K>();
	}

	public V put(K key, V value) {
		claves.add(key);
		return super.put(key, value);
	};

	@Override
	public V remove(Object key) {
		claves.remove(key);
		return super.remove(key);
	}

	public List<K> keyList() {
		return claves;
	}
}
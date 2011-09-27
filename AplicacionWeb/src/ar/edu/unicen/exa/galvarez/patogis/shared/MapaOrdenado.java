package ar.edu.unicen.exa.galvarez.patogis.shared;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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

	}

	public V put(K key, V value) {
		if (claves!=null && !containsKey(key))
			claves.add(key);
		return super.put(key, value);
	};

	@Override
	public V remove(Object key) {
		if (claves!=null)
			claves.remove(key);
		return super.remove(key);
	}

	public List<K> keyList() {
		if (claves==null)
			claves=new ArrayList<K>(keySet());
		return claves;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void ordenarClaves(Comparator c){
		Collections.sort(keyList(), c);
	}

	@SuppressWarnings("unchecked")
	public void ordenarClaves() {
		Collections.sort(((List<String>)keyList()) );
	}
	
}
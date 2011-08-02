package ar.edu.unicen.exa.galvarez.patogis.server;

import java.util.MissingResourceException;
import java.util.ResourceBundle;

public class Configuracion {
	private static final String BUNDLE_NAME = "ar.edu.unicen.exa.galvarez.patogis.server.configuracion"; //$NON-NLS-1$

	private static final ResourceBundle RESOURCE_BUNDLE = ResourceBundle
			.getBundle(BUNDLE_NAME);

	private Configuracion() {
	}

	public static String getString(String key) {
		try {
			return RESOURCE_BUNDLE.getString(key);
		} catch (MissingResourceException e) {
			return '!' + key + '!';
		}
	}
}

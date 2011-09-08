package ar.edu.unicen.exa.galvarez.patogis.linker;

import com.google.gwt.core.ext.linker.Shardable;

/**
 * Application Linker creates the cacheable manifest file
 * 
 * @author L.Pelov
 */
@Shardable
public class AppCacheManifestLinker extends ManifestLinker {

	@Override
	protected String[] otherCachedFiles() {
		return new String[] { "/AplicacionWeb.html", "/AplicacionWeb.css" };
	}

	@Override
	protected String appCacheManifestTemplate() {
		return "myappcache.manifest";
	}
}

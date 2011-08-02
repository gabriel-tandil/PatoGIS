package ar.edu.unicen.exa.galvarez.patogis.server;

import java.io.File;

import ar.edu.unicen.exa.galvarez.patogis.client.ArchivosService;

import com.google.gwt.user.server.rpc.RemoteServiceServlet;

/**
 * The server side implementation of the RPC service.
 */
@SuppressWarnings("serial")
public class ArchivosServiceImpl extends RemoteServiceServlet implements
		ArchivosService {

	@Override
	public void borrar(String archivo) {
		File file = new File(Configuracion.getString("carpeta_imagenes")
				+ archivo);
		file.delete();
	}

}

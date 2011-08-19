package ar.edu.unicen.exa.galvarez.patogis.client;

import com.google.gwt.core.client.GWT;
import com.google.gwt.resources.client.ClientBundle;
import com.google.gwt.resources.client.DataResource;

public interface Mensajes extends ClientBundle {
	Mensajes INSTANCE = GWT.create(Mensajes.class);

	@Source("messages.properties")
	DataResource messages();

}

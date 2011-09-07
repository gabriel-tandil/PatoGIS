package ar.edu.unicen.exa.galvarez.patogis.client;

public class ValidacionException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5901624560842351664L;
	private String mensaje;

	public ValidacionException(String validacion) {
		super();
		mensaje=validacion;
	}

	public String getMensaje() {
		return mensaje;
	}

}

package ar.edu.unicen.exa.galvarez.patogis.client;

public class ValidacionException extends Exception {

	private String mensaje;

	public ValidacionException(String validacion) {
		mensaje=validacion;
	}

	public String getMensaje() {
		return mensaje;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

}

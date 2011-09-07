package ar.edu.unicen.exa.galvarez.patogis.shared;

public class ServicioRemotoException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9118659866263586637L;
	private String mensaje;

	public ServicioRemotoException(){
		super();
	}
	
	public ServicioRemotoException(String validacion) {
		super();
		mensaje=validacion;
	}

	public String getMensaje() {
		return mensaje;
	}



}

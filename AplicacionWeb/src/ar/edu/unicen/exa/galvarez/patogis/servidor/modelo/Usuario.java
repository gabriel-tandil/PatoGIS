package ar.edu.unicen.exa.galvarez.patogis.servidor.modelo;

import java.io.Serializable;

public class Usuario implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5231212078437090694L;

	public Usuario() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column public.usuario.id
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	private Integer id;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column public.usuario.nombre
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	private String nombre;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column public.usuario.clave
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	private String clave;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column public.usuario.tipo
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	private String tipo;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column public.usuario.email
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	private String email;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column public.usuario.telefono
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	private String telefono;

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column public.usuario.id
	 * 
	 * @return the value of public.usuario.id
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column public.usuario.id
	 * 
	 * @param id
	 *            the value for public.usuario.id
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column public.usuario.nombre
	 * 
	 * @return the value of public.usuario.nombre
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column public.usuario.nombre
	 * 
	 * @param nombre
	 *            the value for public.usuario.nombre
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column public.usuario.clave
	 * 
	 * @return the value of public.usuario.clave
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public String getClave() {
		return clave;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column public.usuario.clave
	 * 
	 * @param clave
	 *            the value for public.usuario.clave
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public void setClave(String clave) {
		this.clave = clave;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column public.usuario.tipo
	 * 
	 * @return the value of public.usuario.tipo
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public String getTipo() {
		return tipo;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column public.usuario.tipo
	 * 
	 * @param tipo
	 *            the value for public.usuario.tipo
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column public.usuario.email
	 * 
	 * @return the value of public.usuario.email
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column public.usuario.email
	 * 
	 * @param email
	 *            the value for public.usuario.email
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column public.usuario.telefono
	 * 
	 * @return the value of public.usuario.telefono
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public String getTelefono() {
		return telefono;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column public.usuario.telefono
	 * 
	 * @param telefono
	 *            the value for public.usuario.telefono
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
}
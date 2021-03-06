package ar.edu.unicen.exa.galvarez.patogis.servidor.modelo;

import java.io.Serializable;

public class Ubicacion implements Dominio, Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6698630256722459215L;

	public Ubicacion() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column public.ubicacion.id
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	private Integer id;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column public.ubicacion.nombre
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	private String nombre;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column public.ubicacion.coordenadas
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	private String coordenadas;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column public.ubicacion.altura
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	private Integer altura;

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column public.ubicacion.id
	 * 
	 * @return the value of public.ubicacion.id
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column public.ubicacion.id
	 * 
	 * @param id
	 *            the value for public.ubicacion.id
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column public.ubicacion.nombre
	 * 
	 * @return the value of public.ubicacion.nombre
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column public.ubicacion.nombre
	 * 
	 * @param nombre
	 *            the value for public.ubicacion.nombre
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column public.ubicacion.coordenadas
	 * 
	 * @return the value of public.ubicacion.coordenadas
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public String getCoordenadas() {
		return coordenadas;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column public.ubicacion.coordenadas
	 * 
	 * @param coordenadas
	 *            the value for public.ubicacion.coordenadas
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public void setCoordenadas(String coordenadas) {
		this.coordenadas = coordenadas;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column public.ubicacion.altura
	 * 
	 * @return the value of public.ubicacion.altura
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public Integer getAltura() {
		return altura;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column public.ubicacion.altura
	 * 
	 * @param altura
	 *            the value for public.ubicacion.altura
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public void setAltura(Integer altura) {
		this.altura = altura;
	}
}
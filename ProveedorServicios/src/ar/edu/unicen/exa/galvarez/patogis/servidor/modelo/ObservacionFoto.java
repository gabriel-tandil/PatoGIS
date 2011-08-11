package ar.edu.unicen.exa.galvarez.patogis.servidor.modelo;

import java.io.Serializable;

public class ObservacionFoto implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1352426648450955514L;

	public ObservacionFoto() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column public.observacion_foto.id
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	private Integer id;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column public.observacion_foto.nombre_archivo
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	private String nombreArchivo;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column public.observacion_foto.tipo
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	private String tipo;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column public.observacion_foto.id_observacion
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	private Integer idObservacion;

	private Observacion observacion;

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column public.observacion_foto.id
	 * 
	 * @return the value of public.observacion_foto.id
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column public.observacion_foto.id
	 * 
	 * @param id
	 *            the value for public.observacion_foto.id
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column public.observacion_foto.nombre_archivo
	 * 
	 * @return the value of public.observacion_foto.nombre_archivo
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public String getNombreArchivo() {
		return nombreArchivo;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column public.observacion_foto.nombre_archivo
	 * 
	 * @param nombreArchivo
	 *            the value for public.observacion_foto.nombre_archivo
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public void setNombreArchivo(String nombreArchivo) {
		this.nombreArchivo = nombreArchivo;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column public.observacion_foto.tipo
	 * 
	 * @return the value of public.observacion_foto.tipo
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public String getTipo() {
		return tipo;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column public.observacion_foto.tipo
	 * 
	 * @param tipo
	 *            the value for public.observacion_foto.tipo
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column public.observacion_foto.id_observacion
	 * 
	 * @return the value of public.observacion_foto.id_observacion
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public Integer getIdObservacion() {
		return idObservacion;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column public.observacion_foto.id_observacion
	 * 
	 * @param idObservacion
	 *            the value for public.observacion_foto.id_observacion
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public void setIdObservacion(Integer idObservacion) {
		this.idObservacion = idObservacion;
	}

	public void setObservacion(Observacion observacion) {
		this.observacion = observacion;
	}

	public Observacion getObservacion() {
		return observacion;
	}
}
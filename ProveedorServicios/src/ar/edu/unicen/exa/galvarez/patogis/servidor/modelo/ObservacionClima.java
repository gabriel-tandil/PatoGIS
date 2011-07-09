package ar.edu.unicen.exa.galvarez.patogis.servidor.modelo;

import java.util.Date;

public class ObservacionClima {

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column public.observacion_clima.id
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	private Integer id;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column public.observacion_clima.sol
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	private Boolean sol;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column public.observacion_clima.lluvia
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	private Boolean lluvia;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column public.observacion_clima.nuves
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	private String nuves;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column public.observacion_clima.viento
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	private String viento;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column public.observacion_clima.id_observacion
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	private Integer idObservacion;

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column public.observacion_clima.id
	 * @return  the value of public.observacion_clima.id
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column public.observacion_clima.id
	 * @param id  the value for public.observacion_clima.id
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column public.observacion_clima.sol
	 * @return  the value of public.observacion_clima.sol
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public Boolean getSol() {
		return sol;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column public.observacion_clima.sol
	 * @param sol  the value for public.observacion_clima.sol
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public void setSol(Boolean sol) {
		this.sol = sol;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column public.observacion_clima.lluvia
	 * @return  the value of public.observacion_clima.lluvia
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public Boolean getLluvia() {
		return lluvia;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column public.observacion_clima.lluvia
	 * @param lluvia  the value for public.observacion_clima.lluvia
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public void setLluvia(Boolean lluvia) {
		this.lluvia = lluvia;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column public.observacion_clima.nuves
	 * @return  the value of public.observacion_clima.nuves
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public String getNuves() {
		return nuves;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column public.observacion_clima.nuves
	 * @param nuves  the value for public.observacion_clima.nuves
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public void setNuves(String nuves) {
		this.nuves = nuves;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column public.observacion_clima.viento
	 * @return  the value of public.observacion_clima.viento
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public String getViento() {
		return viento;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column public.observacion_clima.viento
	 * @param viento  the value for public.observacion_clima.viento
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public void setViento(String viento) {
		this.viento = viento;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column public.observacion_clima.id_observacion
	 * @return  the value of public.observacion_clima.id_observacion
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public Integer getIdObservacion() {
		return idObservacion;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column public.observacion_clima.id_observacion
	 * @param idObservacion  the value for public.observacion_clima.id_observacion
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	public void setIdObservacion(Integer idObservacion) {
		this.idObservacion = idObservacion;
	}
}
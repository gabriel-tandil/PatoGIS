package ar.edu.unicen.exa.galvarez.patogis.servidor.logica;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.EspecieExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EspecieMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.especie
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	int countByExample(EspecieExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.especie
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	int deleteByExample(EspecieExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.especie
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.especie
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	int insert(Especie record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.especie
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	int insertSelective(Especie record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.especie
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	List<Especie> selectByExample(EspecieExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.especie
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	Especie selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.especie
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	int updateByExampleSelective(@Param("record") Especie record,
			@Param("example") EspecieExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.especie
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	int updateByExample(@Param("record") Especie record,
			@Param("example") EspecieExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.especie
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	int updateByPrimaryKeySelective(Especie record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.especie
	 * @mbggenerated  Tue Oct 25 20:22:19 ART 2011
	 */
	int updateByPrimaryKey(Especie record);

	List<Especie> selectConCantidadObs();
}
package ar.edu.unicen.exa.galvarez.patogis.servidor.logica;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Campana;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.CampanaExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CampanaMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.campana
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	int countByExample(CampanaExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.campana
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	int deleteByExample(CampanaExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.campana
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.campana
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	int insert(Campana record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.campana
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	int insertSelective(Campana record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.campana
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	List<Campana> selectByExample(CampanaExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.campana
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	Campana selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.campana
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	int updateByExampleSelective(@Param("record") Campana record,
			@Param("example") CampanaExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.campana
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	int updateByExample(@Param("record") Campana record,
			@Param("example") CampanaExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.campana
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	int updateByPrimaryKeySelective(Campana record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.campana
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	int updateByPrimaryKey(Campana record);
}
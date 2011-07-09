package ar.edu.unicen.exa.galvarez.patogis.servidor.logica;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Ubicacion;
import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.UbicacionExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UbicacionMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.ubicacion
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	int countByExample(UbicacionExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.ubicacion
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	int deleteByExample(UbicacionExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.ubicacion
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.ubicacion
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	int insert(Ubicacion record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.ubicacion
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	int insertSelective(Ubicacion record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.ubicacion
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	List<Ubicacion> selectByExample(UbicacionExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.ubicacion
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	Ubicacion selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.ubicacion
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	int updateByExampleSelective(@Param("record") Ubicacion record,
			@Param("example") UbicacionExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.ubicacion
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	int updateByExample(@Param("record") Ubicacion record,
			@Param("example") UbicacionExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.ubicacion
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	int updateByPrimaryKeySelective(Ubicacion record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table public.ubicacion
	 * @mbggenerated  Sun Jun 12 16:42:33 ART 2011
	 */
	int updateByPrimaryKey(Ubicacion record);
}
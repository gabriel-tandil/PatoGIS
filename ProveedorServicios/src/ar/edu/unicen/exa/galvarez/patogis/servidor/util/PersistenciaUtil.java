package ar.edu.unicen.exa.galvarez.patogis.servidor.util;

public class PersistenciaUtil
{
	public static Class<?> getMapper(Class<?> clase) throws ClassNotFoundException
	{
		Class<?> mapperClass = Class.forName("ar.edu.unicen.exa.galvarez.patogis.servidor.logica"+clase.getName().substring(clase.getName().lastIndexOf("."),clase.getName().length())+"Mapper");
		return mapperClass;
	}

	public static Class<?> getExample(Class<?> clase) throws ClassNotFoundException
	{
		Class<?> exampleClass = Class.forName(clase.getName()+"Example");
		return exampleClass;
	}
}
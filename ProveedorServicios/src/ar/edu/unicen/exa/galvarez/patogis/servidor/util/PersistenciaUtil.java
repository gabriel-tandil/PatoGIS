package ar.edu.unicen.exa.galvarez.patogis.servidor.util;

public class PersistenciaUtil
{
	public static Class<?> getMapper(Class<?> clase) throws ClassNotFoundException
	{
		Class<?> mapperClass = Class.forName(clase.getName()+"Mapper");
		return mapperClass;
	}

	public static Class<?> getExample(Class<?> clase) throws ClassNotFoundException
	{
		Class<?> exampleClass = Class.forName(clase.getName()+"Example");
		return exampleClass;
	}
}
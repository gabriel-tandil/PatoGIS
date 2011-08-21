package ar.edu.unicen.exa.galvarez.patogis.client;

import com.google.gwt.i18n.client.ConstantsWithLookup;

public interface EnumConstantes extends ConstantsWithLookup {

	String VientoEnum_Calma();

	String VientoEnum_PocoVentoso();

	String VientoEnum_Ventoso();

	String VientoEnum_MuyVentoso();

	String NubesEnum_Despejado();

	String NubesEnum_ParcialmenteNublado();

	String NubesEnum_MayormenteNublado();

	String NubesEnum_Cubierto();

	String TipoFotoEnum_Panoramica();

	String TipoFotoEnum_Normal();

	String FiabilidadEnum_Fiable();

	String FiabilidadEnum_NoFiable();

	String EstadoEnum_Aprobado();

	String EstadoEnum_ARevisar();

	String EstadoEnum_Desaprobado();

	String EdadEnum_Pichon();

	String EdadEnum_Juvenil();

	String EdadEnum_Adulto();

	String DistanciaEnum_Cerca();

	String DistanciaEnum_Lejos();

	String AlcanceEnum_Total();

	String AlcanceEnum_Parcial();

	String ConteoEnum_Preciso();

	String ConteoEnum_Estimado();

}

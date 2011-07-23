package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.EspecieWS;

public class EspecieWSImpl extends PatoGisWSAbstractImpl<Especie> implements EspecieWS
{
	public EspecieWSImpl()
	{
		super(Especie.class);
	}
}
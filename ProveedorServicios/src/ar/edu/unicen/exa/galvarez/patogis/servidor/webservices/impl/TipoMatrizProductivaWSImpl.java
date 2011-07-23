package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

import ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.TipoMatrizProductiva;
import ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.TipoMatrizProductivaWS;

public class TipoMatrizProductivaWSImpl extends PatoGisWSAbstractImpl<TipoMatrizProductiva> implements TipoMatrizProductivaWS
{
	public TipoMatrizProductivaWSImpl()
	{
		super(TipoMatrizProductiva.class);
	}
}
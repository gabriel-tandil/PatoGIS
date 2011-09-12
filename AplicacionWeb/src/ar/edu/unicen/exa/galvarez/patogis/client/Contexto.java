package ar.edu.unicen.exa.galvarez.patogis.client;


public class Contexto{
	private  boolean online = true;
	private boolean mostroWarningUbicacionesOffline= false;
	private boolean mostroWarningTiposMatrizProductivaOffline= false;
	private boolean mostroWarningEspeciesOffline= false;

	public void setOnline(boolean online) {
		this.online = online;
	}

	public boolean isOnline() {
		return online;
	}

	public void setMostroWarningUbicacionesOffline(
			boolean mostroWarningUbicacionesOffline) {
		this.mostroWarningUbicacionesOffline = mostroWarningUbicacionesOffline;
	}

	public boolean isMostroWarningUbicacionesOffline() {
		return mostroWarningUbicacionesOffline;
	}

	public void setMostroWarningTiposMatrizProductivaOffline(
			boolean mostroWarningTiposMatrizProductivaOffline) {
		this.mostroWarningTiposMatrizProductivaOffline = mostroWarningTiposMatrizProductivaOffline;
	}

	public boolean isMostroWarningTiposMatrizProductivaOffline() {
		return mostroWarningTiposMatrizProductivaOffline;
	}

	public void setMostroWarningEspeciesOffline(boolean mostroWarningEspeciesOffline) {
		this.mostroWarningEspeciesOffline = mostroWarningEspeciesOffline;
	}

	public boolean isMostroWarningEspeciesOffline() {
		return mostroWarningEspeciesOffline;
	}



}
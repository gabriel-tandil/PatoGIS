/**
 * UbicacionWSImpl.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

public interface UbicacionWSImpl extends java.rmi.Remote {
    public ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Ubicacion[] getElementos() throws java.rmi.RemoteException;
    public void addElemento(ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Ubicacion elemento, int idUsuario) throws java.rmi.RemoteException;
}

/**
 * EspecieWSImpl.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

public interface EspecieWSImpl extends java.rmi.Remote {
    public ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie[] getElementos() throws java.rmi.RemoteException;
    public void addElemento(ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie elemento, java.lang.String usuario, java.lang.String clave) throws java.rmi.RemoteException;
    public void editElemento(ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie elemento, java.lang.String usuario, java.lang.String clave) throws java.rmi.RemoteException;
    public ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie[] getElementosConCantidadObs() throws java.rmi.RemoteException;
}

/**
 * TipoMatrizProductivaWSImplServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

public class TipoMatrizProductivaWSImplServiceLocator extends org.apache.axis.client.Service implements ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.TipoMatrizProductivaWSImplService {

    public TipoMatrizProductivaWSImplServiceLocator() {
    }


    public TipoMatrizProductivaWSImplServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public TipoMatrizProductivaWSImplServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for TipoMatrizProductivaWSImpl
    private java.lang.String TipoMatrizProductivaWSImpl_address = "http://localhost:8080/ProveedorServicios/services/TipoMatrizProductivaWSImpl";

    public java.lang.String getTipoMatrizProductivaWSImplAddress() {
        return TipoMatrizProductivaWSImpl_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String TipoMatrizProductivaWSImplWSDDServiceName = "TipoMatrizProductivaWSImpl";

    public java.lang.String getTipoMatrizProductivaWSImplWSDDServiceName() {
        return TipoMatrizProductivaWSImplWSDDServiceName;
    }

    public void setTipoMatrizProductivaWSImplWSDDServiceName(java.lang.String name) {
        TipoMatrizProductivaWSImplWSDDServiceName = name;
    }

    public ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.TipoMatrizProductivaWSImpl getTipoMatrizProductivaWSImpl() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(TipoMatrizProductivaWSImpl_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getTipoMatrizProductivaWSImpl(endpoint);
    }

    public ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.TipoMatrizProductivaWSImpl getTipoMatrizProductivaWSImpl(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.TipoMatrizProductivaWSImplSoapBindingStub _stub = new ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.TipoMatrizProductivaWSImplSoapBindingStub(portAddress, this);
            _stub.setPortName(getTipoMatrizProductivaWSImplWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setTipoMatrizProductivaWSImplEndpointAddress(java.lang.String address) {
        TipoMatrizProductivaWSImpl_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.TipoMatrizProductivaWSImpl.class.isAssignableFrom(serviceEndpointInterface)) {
                ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.TipoMatrizProductivaWSImplSoapBindingStub _stub = new ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.TipoMatrizProductivaWSImplSoapBindingStub(new java.net.URL(TipoMatrizProductivaWSImpl_address), this);
                _stub.setPortName(getTipoMatrizProductivaWSImplWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("TipoMatrizProductivaWSImpl".equals(inputPortName)) {
            return getTipoMatrizProductivaWSImpl();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "TipoMatrizProductivaWSImplService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "TipoMatrizProductivaWSImpl"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("TipoMatrizProductivaWSImpl".equals(portName)) {
            setTipoMatrizProductivaWSImplEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}

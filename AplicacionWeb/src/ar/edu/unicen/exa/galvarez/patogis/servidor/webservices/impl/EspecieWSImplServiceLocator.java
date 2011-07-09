/**
 * EspecieWSImplServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

public class EspecieWSImplServiceLocator extends org.apache.axis.client.Service implements ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.EspecieWSImplService {

    public EspecieWSImplServiceLocator() {
    }


    public EspecieWSImplServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public EspecieWSImplServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for EspecieWSImpl
    private java.lang.String EspecieWSImpl_address = "http://localhost:8080/ProveedorServicios/services/EspecieWSImpl";

    public java.lang.String getEspecieWSImplAddress() {
        return EspecieWSImpl_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String EspecieWSImplWSDDServiceName = "EspecieWSImpl";

    public java.lang.String getEspecieWSImplWSDDServiceName() {
        return EspecieWSImplWSDDServiceName;
    }

    public void setEspecieWSImplWSDDServiceName(java.lang.String name) {
        EspecieWSImplWSDDServiceName = name;
    }

    public ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.EspecieWSImpl getEspecieWSImpl() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(EspecieWSImpl_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getEspecieWSImpl(endpoint);
    }

    public ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.EspecieWSImpl getEspecieWSImpl(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.EspecieWSImplSoapBindingStub _stub = new ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.EspecieWSImplSoapBindingStub(portAddress, this);
            _stub.setPortName(getEspecieWSImplWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setEspecieWSImplEndpointAddress(java.lang.String address) {
        EspecieWSImpl_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.EspecieWSImpl.class.isAssignableFrom(serviceEndpointInterface)) {
                ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.EspecieWSImplSoapBindingStub _stub = new ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.EspecieWSImplSoapBindingStub(new java.net.URL(EspecieWSImpl_address), this);
                _stub.setPortName(getEspecieWSImplWSDDServiceName());
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
        if ("EspecieWSImpl".equals(inputPortName)) {
            return getEspecieWSImpl();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "EspecieWSImplService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "EspecieWSImpl"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("EspecieWSImpl".equals(portName)) {
            setEspecieWSImplEndpointAddress(address);
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

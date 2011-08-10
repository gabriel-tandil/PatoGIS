/**
 * ObservacionWSImplServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

public class ObservacionWSImplServiceLocator extends org.apache.axis.client.Service implements ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.ObservacionWSImplService {

    public ObservacionWSImplServiceLocator() {
    }


    public ObservacionWSImplServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public ObservacionWSImplServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for ObservacionWSImpl
    private java.lang.String ObservacionWSImpl_address = "http://localhost:8080/ProveedorServicios/services/ObservacionWSImpl";

    public java.lang.String getObservacionWSImplAddress() {
        return ObservacionWSImpl_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String ObservacionWSImplWSDDServiceName = "ObservacionWSImpl";

    public java.lang.String getObservacionWSImplWSDDServiceName() {
        return ObservacionWSImplWSDDServiceName;
    }

    public void setObservacionWSImplWSDDServiceName(java.lang.String name) {
        ObservacionWSImplWSDDServiceName = name;
    }

    public ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.ObservacionWSImpl getObservacionWSImpl() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(ObservacionWSImpl_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getObservacionWSImpl(endpoint);
    }

    public ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.ObservacionWSImpl getObservacionWSImpl(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.ObservacionWSImplSoapBindingStub _stub = new ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.ObservacionWSImplSoapBindingStub(portAddress, this);
            _stub.setPortName(getObservacionWSImplWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setObservacionWSImplEndpointAddress(java.lang.String address) {
        ObservacionWSImpl_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.ObservacionWSImpl.class.isAssignableFrom(serviceEndpointInterface)) {
                ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.ObservacionWSImplSoapBindingStub _stub = new ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.ObservacionWSImplSoapBindingStub(new java.net.URL(ObservacionWSImpl_address), this);
                _stub.setPortName(getObservacionWSImplWSDDServiceName());
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
        if ("ObservacionWSImpl".equals(inputPortName)) {
            return getObservacionWSImpl();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "ObservacionWSImplService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "ObservacionWSImpl"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("ObservacionWSImpl".equals(portName)) {
            setObservacionWSImplEndpointAddress(address);
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

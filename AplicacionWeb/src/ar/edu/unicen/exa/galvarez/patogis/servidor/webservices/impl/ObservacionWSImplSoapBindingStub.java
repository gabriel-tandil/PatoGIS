/**
 * ObservacionWSImplSoapBindingStub.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

public class ObservacionWSImplSoapBindingStub extends org.apache.axis.client.Stub implements ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.ObservacionWSImpl {
    private java.util.Vector cachedSerClasses = new java.util.Vector();
    private java.util.Vector cachedSerQNames = new java.util.Vector();
    private java.util.Vector cachedSerFactories = new java.util.Vector();
    private java.util.Vector cachedDeserFactories = new java.util.Vector();

    static org.apache.axis.description.OperationDesc [] _operations;

    static {
        _operations = new org.apache.axis.description.OperationDesc[3];
        _initOperationDesc1();
    }

    private static void _initOperationDesc1(){
        org.apache.axis.description.OperationDesc oper;
        org.apache.axis.description.ParameterDesc param;
        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("getElementos");
        oper.setReturnType(new javax.xml.namespace.QName("http://modelo.servidor.patogis.galvarez.exa.unicen.edu.ar", "Observacion"));
        oper.setReturnClass(ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion[].class);
        oper.setReturnQName(new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "getElementosReturn"));
        oper.setStyle(org.apache.axis.constants.Style.WRAPPED);
        oper.setUse(org.apache.axis.constants.Use.LITERAL);
        _operations[0] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("addElemento");
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "elemento"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://modelo.servidor.patogis.galvarez.exa.unicen.edu.ar", "Observacion"), ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion.class, false, false);
        oper.addParameter(param);
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "usuario"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false);
        oper.addParameter(param);
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "clave"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false);
        oper.addParameter(param);
        oper.setReturnType(org.apache.axis.encoding.XMLType.AXIS_VOID);
        oper.setStyle(org.apache.axis.constants.Style.WRAPPED);
        oper.setUse(org.apache.axis.constants.Use.LITERAL);
        _operations[1] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("editElemento");
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "elemento"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://modelo.servidor.patogis.galvarez.exa.unicen.edu.ar", "Observacion"), ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion.class, false, false);
        oper.addParameter(param);
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "usuario"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false);
        oper.addParameter(param);
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "clave"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false);
        oper.addParameter(param);
        oper.setReturnType(org.apache.axis.encoding.XMLType.AXIS_VOID);
        oper.setStyle(org.apache.axis.constants.Style.WRAPPED);
        oper.setUse(org.apache.axis.constants.Use.LITERAL);
        _operations[2] = oper;

    }

    public ObservacionWSImplSoapBindingStub() throws org.apache.axis.AxisFault {
         this(null);
    }

    public ObservacionWSImplSoapBindingStub(java.net.URL endpointURL, javax.xml.rpc.Service service) throws org.apache.axis.AxisFault {
         this(service);
         super.cachedEndpoint = endpointURL;
    }

    public ObservacionWSImplSoapBindingStub(javax.xml.rpc.Service service) throws org.apache.axis.AxisFault {
        if (service == null) {
            super.service = new org.apache.axis.client.Service();
        } else {
            super.service = service;
        }
        ((org.apache.axis.client.Service)super.service).setTypeMappingVersion("1.2");
            java.lang.Class cls;
            javax.xml.namespace.QName qName;
            javax.xml.namespace.QName qName2;
            java.lang.Class beansf = org.apache.axis.encoding.ser.BeanSerializerFactory.class;
            java.lang.Class beandf = org.apache.axis.encoding.ser.BeanDeserializerFactory.class;
            java.lang.Class enumsf = org.apache.axis.encoding.ser.EnumSerializerFactory.class;
            java.lang.Class enumdf = org.apache.axis.encoding.ser.EnumDeserializerFactory.class;
            java.lang.Class arraysf = org.apache.axis.encoding.ser.ArraySerializerFactory.class;
            java.lang.Class arraydf = org.apache.axis.encoding.ser.ArrayDeserializerFactory.class;
            java.lang.Class simplesf = org.apache.axis.encoding.ser.SimpleSerializerFactory.class;
            java.lang.Class simpledf = org.apache.axis.encoding.ser.SimpleDeserializerFactory.class;
            java.lang.Class simplelistsf = org.apache.axis.encoding.ser.SimpleListSerializerFactory.class;
            java.lang.Class simplelistdf = org.apache.axis.encoding.ser.SimpleListDeserializerFactory.class;
            qName = new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "ArrayOf_tns1_ObservacionEspecie");
            cachedSerQNames.add(qName);
            cls = ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionEspecie[].class;
            cachedSerClasses.add(cls);
            qName = new javax.xml.namespace.QName("http://modelo.servidor.patogis.galvarez.exa.unicen.edu.ar", "ObservacionEspecie");
            qName2 = new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "item");
            cachedSerFactories.add(new org.apache.axis.encoding.ser.ArraySerializerFactory(qName, qName2));
            cachedDeserFactories.add(new org.apache.axis.encoding.ser.ArrayDeserializerFactory());

            qName = new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "ArrayOf_tns1_ObservacionFoto");
            cachedSerQNames.add(qName);
            cls = ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionFoto[].class;
            cachedSerClasses.add(cls);
            qName = new javax.xml.namespace.QName("http://modelo.servidor.patogis.galvarez.exa.unicen.edu.ar", "ObservacionFoto");
            qName2 = new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "item");
            cachedSerFactories.add(new org.apache.axis.encoding.ser.ArraySerializerFactory(qName, qName2));
            cachedDeserFactories.add(new org.apache.axis.encoding.ser.ArrayDeserializerFactory());

            qName = new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "ArrayOf_tns1_ObservacionMatrizProductiva");
            cachedSerQNames.add(qName);
            cls = ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionMatrizProductiva[].class;
            cachedSerClasses.add(cls);
            qName = new javax.xml.namespace.QName("http://modelo.servidor.patogis.galvarez.exa.unicen.edu.ar", "ObservacionMatrizProductiva");
            qName2 = new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "item");
            cachedSerFactories.add(new org.apache.axis.encoding.ser.ArraySerializerFactory(qName, qName2));
            cachedDeserFactories.add(new org.apache.axis.encoding.ser.ArrayDeserializerFactory());

            qName = new javax.xml.namespace.QName("http://modelo.servidor.patogis.galvarez.exa.unicen.edu.ar", "Campana");
            cachedSerQNames.add(qName);
            cls = ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Campana.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://modelo.servidor.patogis.galvarez.exa.unicen.edu.ar", "Especie");
            cachedSerQNames.add(qName);
            cls = ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://modelo.servidor.patogis.galvarez.exa.unicen.edu.ar", "Observacion");
            cachedSerQNames.add(qName);
            cls = ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://modelo.servidor.patogis.galvarez.exa.unicen.edu.ar", "ObservacionClima");
            cachedSerQNames.add(qName);
            cls = ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionClima.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://modelo.servidor.patogis.galvarez.exa.unicen.edu.ar", "ObservacionEspecie");
            cachedSerQNames.add(qName);
            cls = ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionEspecie.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://modelo.servidor.patogis.galvarez.exa.unicen.edu.ar", "ObservacionFoto");
            cachedSerQNames.add(qName);
            cls = ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionFoto.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://modelo.servidor.patogis.galvarez.exa.unicen.edu.ar", "ObservacionMatrizProductiva");
            cachedSerQNames.add(qName);
            cls = ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.ObservacionMatrizProductiva.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://modelo.servidor.patogis.galvarez.exa.unicen.edu.ar", "TipoMatrizProductiva");
            cachedSerQNames.add(qName);
            cls = ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.TipoMatrizProductiva.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://modelo.servidor.patogis.galvarez.exa.unicen.edu.ar", "Ubicacion");
            cachedSerQNames.add(qName);
            cls = ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Ubicacion.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://modelo.servidor.patogis.galvarez.exa.unicen.edu.ar", "Usuario");
            cachedSerQNames.add(qName);
            cls = ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Usuario.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

    }

    protected org.apache.axis.client.Call createCall() throws java.rmi.RemoteException {
        try {
            org.apache.axis.client.Call _call = super._createCall();
            if (super.maintainSessionSet) {
                _call.setMaintainSession(super.maintainSession);
            }
            if (super.cachedUsername != null) {
                _call.setUsername(super.cachedUsername);
            }
            if (super.cachedPassword != null) {
                _call.setPassword(super.cachedPassword);
            }
            if (super.cachedEndpoint != null) {
                _call.setTargetEndpointAddress(super.cachedEndpoint);
            }
            if (super.cachedTimeout != null) {
                _call.setTimeout(super.cachedTimeout);
            }
            if (super.cachedPortName != null) {
                _call.setPortName(super.cachedPortName);
            }
            java.util.Enumeration keys = super.cachedProperties.keys();
            while (keys.hasMoreElements()) {
                java.lang.String key = (java.lang.String) keys.nextElement();
                _call.setProperty(key, super.cachedProperties.get(key));
            }
            // All the type mapping information is registered
            // when the first call is made.
            // The type mapping information is actually registered in
            // the TypeMappingRegistry of the service, which
            // is the reason why registration is only needed for the first call.
            synchronized (this) {
                if (firstCall()) {
                    // must set encoding style before registering serializers
                    _call.setEncodingStyle(null);
                    for (int i = 0; i < cachedSerFactories.size(); ++i) {
                        java.lang.Class cls = (java.lang.Class) cachedSerClasses.get(i);
                        javax.xml.namespace.QName qName =
                                (javax.xml.namespace.QName) cachedSerQNames.get(i);
                        java.lang.Object x = cachedSerFactories.get(i);
                        if (x instanceof Class) {
                            java.lang.Class sf = (java.lang.Class)
                                 cachedSerFactories.get(i);
                            java.lang.Class df = (java.lang.Class)
                                 cachedDeserFactories.get(i);
                            _call.registerTypeMapping(cls, qName, sf, df, false);
                        }
                        else if (x instanceof javax.xml.rpc.encoding.SerializerFactory) {
                            org.apache.axis.encoding.SerializerFactory sf = (org.apache.axis.encoding.SerializerFactory)
                                 cachedSerFactories.get(i);
                            org.apache.axis.encoding.DeserializerFactory df = (org.apache.axis.encoding.DeserializerFactory)
                                 cachedDeserFactories.get(i);
                            _call.registerTypeMapping(cls, qName, sf, df, false);
                        }
                    }
                }
            }
            return _call;
        }
        catch (java.lang.Throwable _t) {
            throw new org.apache.axis.AxisFault("Failure trying to get the Call object", _t);
        }
    }

    public ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion[] getElementos() throws java.rmi.RemoteException {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[0]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "getElementos"));

        setRequestHeaders(_call);
        setAttachments(_call);
 try {        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion[]) _resp;
            } catch (java.lang.Exception _exception) {
                return (ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion[]) org.apache.axis.utils.JavaUtils.convert(_resp, ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion[].class);
            }
        }
  } catch (org.apache.axis.AxisFault axisFaultException) {
  throw axisFaultException;
}
    }

    public void addElemento(ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion elemento, java.lang.String usuario, java.lang.String clave) throws java.rmi.RemoteException {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[1]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "addElemento"));

        setRequestHeaders(_call);
        setAttachments(_call);
 try {        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {elemento, usuario, clave});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        extractAttachments(_call);
  } catch (org.apache.axis.AxisFault axisFaultException) {
  throw axisFaultException;
}
    }

    public void editElemento(ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion elemento, java.lang.String usuario, java.lang.String clave) throws java.rmi.RemoteException {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[2]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://impl.webservices.servidor.patogis.galvarez.exa.unicen.edu.ar", "editElemento"));

        setRequestHeaders(_call);
        setAttachments(_call);
 try {        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {elemento, usuario, clave});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        extractAttachments(_call);
  } catch (org.apache.axis.AxisFault axisFaultException) {
  throw axisFaultException;
}
    }

}

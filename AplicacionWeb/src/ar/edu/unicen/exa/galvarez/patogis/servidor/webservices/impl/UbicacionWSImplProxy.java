package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

public class UbicacionWSImplProxy implements ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.UbicacionWSImpl {
  private String _endpoint = null;
  private ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.UbicacionWSImpl ubicacionWSImpl = null;
  
  public UbicacionWSImplProxy() {
    _initUbicacionWSImplProxy();
  }
  
  public UbicacionWSImplProxy(String endpoint) {
    _endpoint = endpoint;
    _initUbicacionWSImplProxy();
  }
  
  private void _initUbicacionWSImplProxy() {
    try {
      ubicacionWSImpl = (new ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.UbicacionWSImplServiceLocator()).getUbicacionWSImpl();
      if (ubicacionWSImpl != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)ubicacionWSImpl)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)ubicacionWSImpl)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (ubicacionWSImpl != null)
      ((javax.xml.rpc.Stub)ubicacionWSImpl)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.UbicacionWSImpl getUbicacionWSImpl() {
    if (ubicacionWSImpl == null)
      _initUbicacionWSImplProxy();
    return ubicacionWSImpl;
  }
  
  public ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Ubicacion[] getElementos() throws java.rmi.RemoteException{
    if (ubicacionWSImpl == null)
      _initUbicacionWSImplProxy();
    return ubicacionWSImpl.getElementos();
  }
  
  public void addElemento(ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Ubicacion elemento, java.lang.String usuario, java.lang.String clave) throws java.rmi.RemoteException{
    if (ubicacionWSImpl == null)
      _initUbicacionWSImplProxy();
    ubicacionWSImpl.addElemento(elemento, usuario, clave);
  }
  
  public void editElemento(ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Ubicacion elemento, java.lang.String usuario, java.lang.String clave) throws java.rmi.RemoteException{
    if (ubicacionWSImpl == null)
      _initUbicacionWSImplProxy();
    ubicacionWSImpl.editElemento(elemento, usuario, clave);
  }
  
  
}
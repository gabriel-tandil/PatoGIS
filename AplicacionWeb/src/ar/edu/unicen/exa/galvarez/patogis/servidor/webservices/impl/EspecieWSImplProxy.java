package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

public class EspecieWSImplProxy implements ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.EspecieWSImpl {
  private String _endpoint = null;
  private ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.EspecieWSImpl especieWSImpl = null;
  
  public EspecieWSImplProxy() {
    _initEspecieWSImplProxy();
  }
  
  public EspecieWSImplProxy(String endpoint) {
    _endpoint = endpoint;
    _initEspecieWSImplProxy();
  }
  
  private void _initEspecieWSImplProxy() {
    try {
      especieWSImpl = (new ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.EspecieWSImplServiceLocator()).getEspecieWSImpl();
      if (especieWSImpl != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)especieWSImpl)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)especieWSImpl)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (especieWSImpl != null)
      ((javax.xml.rpc.Stub)especieWSImpl)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.EspecieWSImpl getEspecieWSImpl() {
    if (especieWSImpl == null)
      _initEspecieWSImplProxy();
    return especieWSImpl;
  }
  
  public ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie[] getElementos() throws java.rmi.RemoteException{
    if (especieWSImpl == null)
      _initEspecieWSImplProxy();
    return especieWSImpl.getElementos();
  }
  
  public void addElemento(ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie elemento, int idUsuario) throws java.rmi.RemoteException{
    if (especieWSImpl == null)
      _initEspecieWSImplProxy();
    especieWSImpl.addElemento(elemento, idUsuario);
  }
  
  public ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Especie[] getElementosOrdenadosCantidadObs() throws java.rmi.RemoteException{
    if (especieWSImpl == null)
      _initEspecieWSImplProxy();
    return especieWSImpl.getElementosOrdenadosCantidadObs();
  }
  
  
}
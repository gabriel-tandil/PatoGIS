package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

public class ObservacionWSImplProxy implements ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.ObservacionWSImpl {
  private String _endpoint = null;
  private ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.ObservacionWSImpl observacionWSImpl = null;
  
  public ObservacionWSImplProxy() {
    _initObservacionWSImplProxy();
  }
  
  public ObservacionWSImplProxy(String endpoint) {
    _endpoint = endpoint;
    _initObservacionWSImplProxy();
  }
  
  private void _initObservacionWSImplProxy() {
    try {
      observacionWSImpl = (new ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.ObservacionWSImplServiceLocator()).getObservacionWSImpl();
      if (observacionWSImpl != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)observacionWSImpl)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)observacionWSImpl)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (observacionWSImpl != null)
      ((javax.xml.rpc.Stub)observacionWSImpl)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.ObservacionWSImpl getObservacionWSImpl() {
    if (observacionWSImpl == null)
      _initObservacionWSImplProxy();
    return observacionWSImpl;
  }
  
  public ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion[] getElementos() throws java.rmi.RemoteException{
    if (observacionWSImpl == null)
      _initObservacionWSImplProxy();
    return observacionWSImpl.getElementos();
  }
  
  public void addElemento(ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Observacion elemento, int idUsuario) throws java.rmi.RemoteException{
    if (observacionWSImpl == null)
      _initObservacionWSImplProxy();
    observacionWSImpl.addElemento(elemento, idUsuario);
  }
  
  
}
package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

public class TipoMatrizProductivaWSImplProxy implements ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.TipoMatrizProductivaWSImpl {
  private String _endpoint = null;
  private ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.TipoMatrizProductivaWSImpl tipoMatrizProductivaWSImpl = null;
  
  public TipoMatrizProductivaWSImplProxy() {
    _initTipoMatrizProductivaWSImplProxy();
  }
  
  public TipoMatrizProductivaWSImplProxy(String endpoint) {
    _endpoint = endpoint;
    _initTipoMatrizProductivaWSImplProxy();
  }
  
  private void _initTipoMatrizProductivaWSImplProxy() {
    try {
      tipoMatrizProductivaWSImpl = (new ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.TipoMatrizProductivaWSImplServiceLocator()).getTipoMatrizProductivaWSImpl();
      if (tipoMatrizProductivaWSImpl != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)tipoMatrizProductivaWSImpl)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)tipoMatrizProductivaWSImpl)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (tipoMatrizProductivaWSImpl != null)
      ((javax.xml.rpc.Stub)tipoMatrizProductivaWSImpl)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.TipoMatrizProductivaWSImpl getTipoMatrizProductivaWSImpl() {
    if (tipoMatrizProductivaWSImpl == null)
      _initTipoMatrizProductivaWSImplProxy();
    return tipoMatrizProductivaWSImpl;
  }
  
  public void addElemento(ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.TipoMatrizProductiva elemento, int idUsuario) throws java.rmi.RemoteException{
    if (tipoMatrizProductivaWSImpl == null)
      _initTipoMatrizProductivaWSImplProxy();
    tipoMatrizProductivaWSImpl.addElemento(elemento, idUsuario);
  }
  
  public ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.TipoMatrizProductiva[] getElementos() throws java.rmi.RemoteException{
    if (tipoMatrizProductivaWSImpl == null)
      _initTipoMatrizProductivaWSImplProxy();
    return tipoMatrizProductivaWSImpl.getElementos();
  }
  
  
}
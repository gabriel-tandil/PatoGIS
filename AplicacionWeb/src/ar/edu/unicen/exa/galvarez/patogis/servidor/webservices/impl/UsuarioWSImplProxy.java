package ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl;

public class UsuarioWSImplProxy implements ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.UsuarioWSImpl {
  private String _endpoint = null;
  private ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.UsuarioWSImpl usuarioWSImpl = null;
  
  public UsuarioWSImplProxy() {
    _initUsuarioWSImplProxy();
  }
  
  public UsuarioWSImplProxy(String endpoint) {
    _endpoint = endpoint;
    _initUsuarioWSImplProxy();
  }
  
  private void _initUsuarioWSImplProxy() {
    try {
      usuarioWSImpl = (new ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.UsuarioWSImplServiceLocator()).getUsuarioWSImpl();
      if (usuarioWSImpl != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)usuarioWSImpl)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)usuarioWSImpl)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (usuarioWSImpl != null)
      ((javax.xml.rpc.Stub)usuarioWSImpl)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public ar.edu.unicen.exa.galvarez.patogis.servidor.webservices.impl.UsuarioWSImpl getUsuarioWSImpl() {
    if (usuarioWSImpl == null)
      _initUsuarioWSImplProxy();
    return usuarioWSImpl;
  }
  
  public ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Usuario[] getElementos() throws java.rmi.RemoteException{
    if (usuarioWSImpl == null)
      _initUsuarioWSImplProxy();
    return usuarioWSImpl.getElementos();
  }
  
  public void addElemento(ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Usuario elemento, int idUsuario) throws java.rmi.RemoteException{
    if (usuarioWSImpl == null)
      _initUsuarioWSImplProxy();
    usuarioWSImpl.addElemento(elemento, idUsuario);
  }
  
  public void editElemento(ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Usuario elemento, int idUsuario) throws java.rmi.RemoteException{
    if (usuarioWSImpl == null)
      _initUsuarioWSImplProxy();
    usuarioWSImpl.editElemento(elemento, idUsuario);
  }
  
  public ar.edu.unicen.exa.galvarez.patogis.servidor.modelo.Usuario obtenerUsuario(java.lang.String usuario, java.lang.String clave) throws java.rmi.RemoteException{
    if (usuarioWSImpl == null)
      _initUsuarioWSImplProxy();
    return usuarioWSImpl.obtenerUsuario(usuario, clave);
  }
  
  
}
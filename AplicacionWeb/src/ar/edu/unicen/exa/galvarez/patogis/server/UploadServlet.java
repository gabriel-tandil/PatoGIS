package ar.edu.unicen.exa.galvarez.patogis.server;
import static gwtupload.shared.UConsts.*;
import gwtupload.server.UploadAction;
import gwtupload.server.exceptions.UploadActionException;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;


public class UploadServlet extends UploadAction {

  private static final long serialVersionUID = 1L;
  
  Hashtable<String, String> receivedContentTypes = new Hashtable<String, String>();
  /**
   * Maintain a list with received files and their content types. 
   */
  Hashtable<String, File> receivedFiles = new Hashtable<String, File>();

  /**
   * Override executeAction to save the received files in a custom place
   * and delete this items from session.  
   */
  @Override
  public String executeAction(HttpServletRequest request, List<FileItem> sessionFiles) throws UploadActionException {
    String response = ""; //$NON-NLS-1$
    int cont = 0;
    for (FileItem item : sessionFiles) {
      if (false == item.isFormField()) {
        cont ++;
        try {
          /// Create a new file based on the remote file name in the client
           String saveName = item.getName().replaceAll("[\\\\/><\\|\\s\"'{}()\\[\\]]+", "_"); //$NON-NLS-1$ //$NON-NLS-2$
           saveName=System.currentTimeMillis()+"_"+saveName;
           File file =new File(Configuracion.getString("carpeta_imagenes") + saveName); //$NON-NLS-1$
          
          item.write(file);
          
          /// Save a list with the received files
          receivedFiles.put(item.getFieldName(), file);
          receivedContentTypes.put(item.getFieldName(), item.getContentType());
          
          /// Send a customized message to the client.
          response +=  file.getName(); 

        } catch (Exception e) {
          throw new UploadActionException(e.getMessage());
        }
      }
    }
    
    /// Remove files from session because we have a copy of them
    removeSessionFileItems(request);
    
    /// Send your customized message to the client.
    return response;
  }
  
  /**
   * Get the content of an uploaded file.
   */
  @Override
  public void getUploadedFile(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String fieldName = request.getParameter(PARAM_SHOW);
    File f = receivedFiles.get(fieldName);
    if (f != null) {
      response.setContentType(receivedContentTypes.get(fieldName));
      FileInputStream is = new FileInputStream(f);
      copyFromInputStreamToOutputStream(is, response.getOutputStream());
    } else {
      renderXmlResponse(request, response, "ERROR_ITEM_NOT_FOUND"); //$NON-NLS-1$
   }
  }
  
  /**
   * Remove a file when the user sends a delete request.
   */
  @Override
  public void removeItem(HttpServletRequest request, String fieldName)  throws UploadActionException {
    File file = receivedFiles.get(fieldName);
    receivedFiles.remove(fieldName);
    receivedContentTypes.remove(fieldName);
    if (file != null) {
      file.delete();
    }
  }
}

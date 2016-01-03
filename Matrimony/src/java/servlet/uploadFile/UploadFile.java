/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.uploadFile;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Admin
 */
public class UploadFile {

    public static String upload(HttpServletRequest request, String name) {
        
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        
        if (isMultipart) {
            // Create a factory for disk-based file items
            FileItemFactory factory = new DiskFileItemFactory();

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);

            String path = "";
            try {
                // Parse the request
                List items = upload.parseRequest(request);
                Iterator iterator = items.iterator();

                while (iterator.hasNext()) {
                    FileItem item = (FileItem) iterator.next();
                    if (!item.isFormField()) {
                        String fileName = item.getName();

                        String root = request.getServletContext().getRealPath("/");
                        String dir = root + "/img/" + name;
                        path = request.getScheme() +"://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() +"/img/" + name + "/" + fileName;

                   
                        File folder = new File(dir);
                        if (!folder.exists()) {
                            folder.mkdir();
                        }

                        File uploadedFile = new File(folder + File.separator + fileName);
                        if (!uploadedFile.exists()) {
                            item.write(uploadedFile);
                        }

                    }
                }
                return path;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "";
    }
}

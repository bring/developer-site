package com.bring.developer.web;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;

import javax.activation.MimeType;
import javax.activation.MimetypesFileTypeMap;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DownloadController {
    @Autowired
    ServletContext servletContext;
    
    @RequestMapping("/static.html")
    public ModelAndView download(HttpServletRequest request, HttpServletResponse response, @RequestParam String file) throws Exception {
        File fileObj = new File(file);
        MimetypesFileTypeMap mime = new MimetypesFileTypeMap();
        
        if (fileObj.canRead()) {
            FileInputStream inputStream = new FileInputStream(fileObj);
            response.setContentType(mime.getContentType(fileObj));
            response.setHeader("Content-Disposition", "attachment; filename=\""+ fileObj.getName() + "\"");
            response.setContentLength((int) fileObj.length());
            FileCopyUtils.copy(inputStream, response.getOutputStream());
            inputStream.close();
            response.getOutputStream().flush();
            response.getOutputStream().close();
        } 
        else {
            response.setContentType("text/html");
            PrintWriter printwriter = response.getWriter();
            printwriter.println("<html>");
            printwriter.println("<br><br><br><h2>Could not get file name:<br>"+ file + "</h2>");
            printwriter.println("<br><br><br><center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
            printwriter.println("<br><br><br>&copy; webAccess");
            printwriter.println("</html>");
            printwriter.flush();
            printwriter.close();
        }

        return null;
    }

}
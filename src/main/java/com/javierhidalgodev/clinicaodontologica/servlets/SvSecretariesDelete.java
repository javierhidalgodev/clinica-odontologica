package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Javi
 */
@WebServlet(name = "SvSecretariesDelete", urlPatterns = {"/SvSecretariesDelete"})
public class SvSecretariesDelete extends HttpServlet {

        Controller controller = Controller.getInstance();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idUserToDelete = request.getParameter("id");
        
        if(idUserToDelete != null && !idUserToDelete.isEmpty()) {
            int idSecretary = Integer.parseInt(idUserToDelete);
            controller.destroySecretary(idSecretary);
        }
                
        response.sendRedirect("SvSecretaries");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

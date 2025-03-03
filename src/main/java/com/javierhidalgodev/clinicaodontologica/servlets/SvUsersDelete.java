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
@WebServlet(name = "SvUsersDelete", urlPatterns = {"/SvUsersDelete"})
public class SvUsersDelete extends HttpServlet {

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
            int idUser = Integer.parseInt(idUserToDelete);
            controller.destroyUser(idUser);
        }
                
        response.sendRedirect("SvUsers");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Javi
 */
@WebServlet(name = "SvUsersEdit", urlPatterns = {"/SvUsersEdit"})
public class SvUsersEdit extends HttpServlet {

    Controller controller = new Controller();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userIdToEdit = request.getParameter("id");

        if (userIdToEdit != null && !userIdToEdit.isEmpty()) {
            int userId = Integer.parseInt(userIdToEdit);
            Usuario userToEdit = controller.getUserById(userId);
            System.out.println(userToEdit.getUsername());
            
            request.getSession().setAttribute("userToEdit", userToEdit);
            
            response.sendRedirect("edicionUsuario.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String role = request.getParameter("role");
        
        Usuario userToEdit = (Usuario) request.getSession().getAttribute("userToEdit");
        userToEdit.setUsername(username);
        userToEdit.setRole(role);
        
        controller.editUser(userToEdit);
        
        response.sendRedirect("SvUsers");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

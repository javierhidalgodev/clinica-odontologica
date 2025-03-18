package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Javi
 */
@WebServlet(name = "SvUsers", urlPatterns = {"/SvUsers"})
public class SvUsers extends HttpServlet {

    Controller controller = Controller.getInstance();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<UserDTO> users = controller.getAllUsers();
        
        request.getSession().setAttribute("userList", users);
        response.sendRedirect("vistaUsuarios.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = (String) request.getParameter("username");
        String password = (String) request.getParameter("password");
        String role;
        
        if(request.getParameter("role") != null) {
            role = request.getParameter("role");
        } else {
            role = "NA";
        }
        
        controller.createUser(username, password, role);
        
        response.sendRedirect("SvUsers");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

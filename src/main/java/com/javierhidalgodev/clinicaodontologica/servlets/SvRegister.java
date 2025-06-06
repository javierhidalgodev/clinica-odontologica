package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.services.UserService;
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
@WebServlet(name = "SvRegister", urlPatterns = {"/register"})
public class SvRegister extends HttpServlet {

    Controller controller = Controller.getInstance();
    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/registerView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        userService.createUser(request, response);      
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        String role = request.getParameter("role");
//
//        if (controller.userExists(username)) {
//            request.setAttribute("userExists", true);
//
//            request.getRequestDispatcher("/WEB-INF/views/registerView.jsp").forward(request, response);
//            return;
//        } else {
//            controller.createUser(username, password, role);
//
//            response.sendRedirect(request.getContextPath() + "/login");
//        }
    }
}

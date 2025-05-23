package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.servlets.services.UserService;
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
@WebServlet(name = "SvUsers", urlPatterns = {"/users", "/users/new"})
public class SvUsers extends HttpServlet {

    UserService userService = new UserService();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String servletPath = request.getServletPath();

        if (servletPath.contains("new")) {
            request.getRequestDispatcher("/WEB-INF/views/altaUsuario.jsp").forward(request, response);
        } else {
            String queryParams = request.getQueryString();

            if (queryParams == null) {
                userService.getAllUsers(request, response);
            } else {
                String id = request.getParameter("id");
                if (id == null) {
                    response.sendRedirect("users");
                } else {
                    userService.editingUser(request, response);
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("getInfo".equals(action)) {
            userService.getInfo(request, response);
        } else if ("create".equals(action)) {
            userService.createUser(request, response);
        } else if ("delete".equals(action)) {
            userService.deleteUser(request, response);
        } else if ("editing".equals(action)) {
            userService.editingUser(request, response);
        } else if ("edit".equals(action)) {
            userService.editUser(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.services.UserService;
import com.javierhidalgodev.clinicaodontologica.utils.PathUtils;
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
@WebServlet(name = "SvUsers", urlPatterns = {
    "/users",
    "/users/*"})
public class SvUsers extends HttpServlet {

    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pathInfo = request.getPathInfo();

        if (pathInfo == null) {
            userService.getAllUsers(request, response);
            return;
        }

        if (PathUtils.isPathInfoID(pathInfo) != null) {
            userService.getInfo(request, response, PathUtils.isPathInfoID(pathInfo));
            return;
        }

        if (PathUtils.isPathInfoNew(pathInfo)) {
            request.getRequestDispatcher("/WEB-INF/views/userRegisterView.jsp").forward(request, response);
            return;
        } else {
            response.sendRedirect(request.getContextPath() + "/users");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo != null) {
            Integer patientID = PathUtils.isPathInfoID(pathInfo);
            String action = request.getParameter("action");

            if (patientID != null && "getInfo".equals(action)) {
                userService.getInfo(request, response, patientID);
            } else {
                if ("create".equals(action)) {
                    userService.createUser(request, response);
                } else if ("delete".equals(action)) {
                    userService.deleteUser(request, response);
                } else if ("editing".equals(action)) {
                    userService.editingUser(request, response, patientID);
                } else if ("edit".equals(action)) {
                    userService.editUser(request, response, patientID);
                } else {
                    response.sendRedirect(request.getContextPath() + "/index");
                }
            }
        }
    }
}

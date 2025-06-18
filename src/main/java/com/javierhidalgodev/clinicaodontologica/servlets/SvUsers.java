package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.services.UserService;
import com.javierhidalgodev.clinicaodontologica.utils.PathUtils;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvUsers", urlPatterns = {
    "/users",
    "/users/*",})
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
            String queryParams = request.getQueryString();
            if (queryParams != null) {
                if (queryParams.equals("editing=true")) {
                    userService.editingUser(request, response, PathUtils.isPathInfoID(pathInfo));
                    return;
                } else {
                    response.sendRedirect(request.getContextPath() + "/users" + pathInfo);
                    return;
                }
            }

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

        if (pathInfo == null) {
            response.sendRedirect(request.getContextPath() + request.getServletPath());
            return;
        }

        String action = request.getParameter("action");

        if (action != null) {
            userService.doAction(pathInfo, action, request, response);
            return;
        }

        response.sendRedirect(request.getContextPath() + "/index");
    }
}

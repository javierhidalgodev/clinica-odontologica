package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.services.OdontologistService;
import com.javierhidalgodev.clinicaodontologica.utils.PathUtils;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvOdontologists", urlPatterns = {
    "/odontologists",
    "/odontologists/*",})
public class SvOdontologists extends HttpServlet {

    OdontologistService odontologistService = new OdontologistService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo == null) {
            odontologistService.getAllOdontologists(request, response);
            return;
        }

        if (PathUtils.isPathInfoID(pathInfo) != null) {
            String queryParams = request.getQueryString();
            if (queryParams != null) {
                if (queryParams.equals("editing=true")) {
                    odontologistService.editingOdontologist(request, response, PathUtils.isPathInfoID(pathInfo));
                    return;
                } else {
                    response.sendRedirect(request.getContextPath() + "/odontologists" + pathInfo);
                    return;
                }
            }

            odontologistService.getInfo(request, response, PathUtils.isPathInfoID(pathInfo));
            return;
        }

        if (PathUtils.isPathInfoNew(pathInfo)) {
            odontologistService.loadFormData(request, response);
            return;
        } else {
            response.sendRedirect(request.getContextPath() + "/odontologists");
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
            odontologistService.doAction(pathInfo, action, request, response);
            return;
        }

        response.sendRedirect(request.getContextPath() + "/index");
    }
}

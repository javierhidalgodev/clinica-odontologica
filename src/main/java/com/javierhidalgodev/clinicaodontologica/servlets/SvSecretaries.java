package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.services.SecretaryService;
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
@WebServlet(name = "SvSecretaries", urlPatterns = {
    "/secretaries",
    "/secretaries/*"})
public class SvSecretaries extends HttpServlet {

    SecretaryService secretaryService = new SecretaryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo == null) {
            secretaryService.getAllSecretaries(request, response);
            return;
        }

        if (PathUtils.isPathInfoID(pathInfo) != null) {
            secretaryService.getInfo(request, response, PathUtils.isPathInfoID(pathInfo));
            return;
        }

        if (PathUtils.isPathInfoNew(pathInfo)) {
            request.getRequestDispatcher("/WEB-INF/views/secretaryRegisterView.jsp").forward(request, response);
            return;
        } else {
            response.sendRedirect(request.getContextPath() + "/secretaries");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo != null) {
            Integer secretaryID = PathUtils.isPathInfoID(pathInfo);
            String action = request.getParameter("action");

            if (secretaryID != null && "getInfo".equals(action)) {
                secretaryService.getInfo(request, response, secretaryID);
            } else {
                if ("create".equals(action)) {
                    secretaryService.createSecretary(request, response);
                } else if ("delete".equals(action)) {
                    secretaryService.deleteSecretary(request, response);
                } else if ("editing".equals(action)) {
                    secretaryService.editingSecretary(request, response, secretaryID);
                } else if ("edit".equals(action)) {
                    secretaryService.editSecretary(request, response, secretaryID);
                } else {
                    response.sendRedirect(request.getContextPath() + "/index");
                }
            }
        }
    }
}

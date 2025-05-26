package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.servlets.services.SecretaryService;
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
@WebServlet(name = "SvSecretaries", urlPatterns = {"/secretaries", "/secretaries/new"})
public class SvSecretaries extends HttpServlet {

    SecretaryService secretaryService = new SecretaryService();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String servletPath = request.getServletPath();

        if (servletPath.contains("new")) {
            request.getRequestDispatcher("/WEB-INF/views/secretaryRegisterView.jsp").forward(request, response);
        } else {
            String queryParams = request.getQueryString();

            if (queryParams == null) {
                System.err.println("NO HAY PARÁMETROS");
                secretaryService.getAllSecretaries(request, response);
            } else {
                System.err.println("RECUPERO QUERYPARAMS: " + queryParams);
                String id = request.getParameter("id");

                if (id == null) {
                    System.err.println("NO HAY ID. VOY A SECRETARIOS");
                    response.sendRedirect("secretaries");
//                request.getRequestDispatcher("WEB-INF/views/secretariesView.jsp").forward(request, response);
//                return;
                } else {
                    System.err.println("HAY ID. INTENTO RECUPERAR UN SECRETARIO: " + id);
                    secretaryService.getInfo(request, response);
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        // No se ha implementado una pantalla intermedia para la visualización de data
        // Directamente se pasa de la tabla, al fomulario de edición
        if("getInfo".equals(action)) {
            secretaryService.getInfo(request, response);
        } else if ("create".equals(action)) {
            secretaryService.createSecretary(request, response);
        } else if ("editing".equals(action)) {
            secretaryService.editingSecretary(request, response);
        } else if ("edit".equals(action)) {
            secretaryService.editSecretary(request, response);
        } else if ("delete".equals(action)) {
            secretaryService.deleteSecretary(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }
}

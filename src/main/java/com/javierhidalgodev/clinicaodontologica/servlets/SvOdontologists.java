package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.servlets.services.OdontologistService;
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
@WebServlet(name = "SvOdontologists", urlPatterns = {"/odontologists", "/odontologists/new"})
public class SvOdontologists extends HttpServlet {

    OdontologistService odontologistService = new OdontologistService();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String servletPath = request.getServletPath();
        
        if(servletPath.contains("new")) {
            request.getRequestDispatcher("/WEB-INF/views/odontologistRegisterView.jsp").forward(request, response);
        } else {
            String queryParams = request.getQueryString();

            // Si no hay queryParams trae todos los odontólogos
            if (queryParams == null) {
                odontologistService.getAllOdontologists(request, response);
            } else {
                // Si hubiera, recupera el param id
                String id = request.getParameter("id");

                // Si este no existe (a fin de evitar parámetros tipeados desconocidos)
                // Se redirecciona a este mismo servlet, lo que limpia la url, y hace
                // la operación de arriba
                if (id == null) {
                    response.sendRedirect("odontologists");
                } else if (!id.isEmpty()) {
                    // De existir el id, se hará la operación de comprobación
                    // Devolviendo la data del odontólogo, o si no existe
                    // redirigiendo a la vista general
                    odontologistService.getInfo(request, response);
                }
            }            
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("getInfo".equals(action)) {
            odontologistService.getInfo(request, response);
        } else if ("create".equals(action)) {
            odontologistService.createOdontologist(request, response);
        } else if ("delete".equals(action)) {
            odontologistService.deleteOdontologist(request, response);
        } else if ("editing".equals(action)) {
            odontologistService.editingOdontologist(request, response);
        } else if ("edit".equals(action)) {
            odontologistService.editOdontologist(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }
}

package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.services.GuardianService;
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
@WebServlet(name = "SvGuardians", urlPatterns = {"/guardians"})
public class SvGuardians extends HttpServlet {

    GuardianService guardianService = new GuardianService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("getInfo".equals(action)) {
            // No hay pantalla intermedia de visualización
        } else if ("create".equals(action)) {
            // Se crea con el paciente
        } else if ("delete".equals(action)) {
            guardianService.deleteGuardian(request, response);
        } else if ("editing".equals(action)) {
            // No hay pantalla intermedia de visualización
            guardianService.editingGuardian(request, response);
        } else if ("edit".equals(action)) {
            guardianService.editGuardian(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }
}

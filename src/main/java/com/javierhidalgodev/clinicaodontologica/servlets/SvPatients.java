package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.servlets.services.PatientService;
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
@WebServlet(name = "SvPatients", urlPatterns = {"/patients", "/patients/new"})
public class SvPatients extends HttpServlet {

    PatientService patientService = new PatientService();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String servletPath = request.getServletPath();

        if (servletPath.contains("new")) {
            request.getRequestDispatcher("/WEB-INF/views/altaPaciente.jsp").forward(request, response);
        } else {
            String queryParams = request.getQueryString();

            if (queryParams == null) {
                patientService.getAllPatients(request, response);
            } else {
                String id = request.getParameter("id");

                if (id == null) {
                    response.sendRedirect("patients");
                } else {
                    patientService.getInfo(request, response);
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {

            if ("getInfo".equals(action)) {
                patientService.getInfo(request, response);
            } else if ("create".equals(action)) {
                patientService.createPatient(request, response);
            } else if ("delete".equals(action)) {
                patientService.deletePatient(request, response);
            } else if ("editing".equals(action)) {
                patientService.editingPatient(request, response);
            } else if ("edit".equals(action)) {
                patientService.editPatient(request, response);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }
}

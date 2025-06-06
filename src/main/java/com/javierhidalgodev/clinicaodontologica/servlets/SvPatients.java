package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.services.PatientService;
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
@WebServlet(name = "SvPatients", urlPatterns = {
    "/patients",
    "/patients/*"})
public class SvPatients extends HttpServlet {

    PatientService patientService = new PatientService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo == null) {
            patientService.getAllPatients(request, response);
            return;
        }

        if (PathUtils.isPathInfoID(pathInfo) != null) {
            patientService.getInfo(request, response, PathUtils.isPathInfoID(pathInfo));
            return;
        }

        if (PathUtils.isPathInfoNew(pathInfo)) {
            request.getRequestDispatcher("/WEB-INF/views/patientRegisterView.jsp").forward(request, response);
            return;
        } else {
            response.sendRedirect(request.getContextPath() + "/patients");
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
                patientService.getInfo(request, response, patientID);
            } else {
                if ("create".equals(action)) {
                    patientService.createPatient(request, response);
                } else if ("delete".equals(action)) {
                    patientService.deletePatient(request, response);
                } else if ("editing".equals(action)) {
                    patientService.editingPatient(request, response, patientID);
                } else if ("edit".equals(action)) {
                    patientService.editPatient(request, response, patientID);
                } else {
                    response.sendRedirect(request.getContextPath() + "/index");
                }
            }
        }
    }
}

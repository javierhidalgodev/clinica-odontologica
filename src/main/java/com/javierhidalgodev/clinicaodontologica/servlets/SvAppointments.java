package com.javierhidalgodev.clinicaodontologica.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javierhidalgodev.clinicaodontologica.servlets.services.AppointmentService;

/**
 *
 * @author Javi
 */
@WebServlet(name = "SvAppointments", urlPatterns = {
    "/appointments",
    "/appointments/*",
    "/appointments/new/patient",
    "/appointments/new/professional",
    "/appointments/new/confirmation",
    "/appointments/new/ok",})
public class SvAppointments extends HttpServlet {

    AppointmentService appointmentService = new AppointmentService();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo != null) {
            String appointmentID = pathInfo.split("/")[1];
            int pathInfoLength = pathInfo.split("/").length;

            if (appointmentID.matches("\\d+") && pathInfoLength == 2) {
                appointmentService.getAppointmentInfo(request, response, appointmentID);
            } else {
                response.sendRedirect(request.getContextPath() + "/index");
            }

        } else {
            String servletPath = request.getServletPath();

            if (servletPath.contains("patient")) {
                appointmentService.handleAppointmentPatient(request, response);
            } else if (servletPath.contains("professional")) {
                appointmentService.handleAppointmentProfessional(request, response);
            } else if (servletPath.contains("confirmation")) {
                appointmentService.handleAppointmentCheck(request, response);
            } else if (servletPath.contains("ok")) {
                appointmentService.handleAppointmentConfirmation(request, response);
            } else {
                String queryParams = request.getQueryString();

                if (queryParams == null) {
                    appointmentService.getAllAppointments(request, response);
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo != null) {
            String info = request.getPathInfo().split("/")[1];

            if (info.matches("\\d+")) {
                appointmentService.getAppointmentInfo(request, response, info);
            }

        } else {
            String step = request.getParameter("step");

            switch (step) {
                case "1":
                    appointmentService.handleAppointmentProfessional(request, response);
                    break;
                case "2":
                    appointmentService.handleAppointmentCheck(request, response);
                    break;
                case "3":
                    appointmentService.handleAppointmentConfirmation(request, response);
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/index");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

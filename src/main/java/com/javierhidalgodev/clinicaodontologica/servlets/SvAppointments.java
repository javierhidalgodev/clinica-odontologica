package com.javierhidalgodev.clinicaodontologica.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javierhidalgodev.clinicaodontologica.services.AppointmentService;
import com.javierhidalgodev.clinicaodontologica.utils.PathUtils;

/**
 *
 * @author Javi
 */
@WebServlet(name = "SvAppointments", urlPatterns = {
    "/appointments",
    "/appointments/*",
    "/appointments/reset",
    "/appointments/new/patient",
    "/appointments/new/professional",
    "/appointments/new/confirmation",
    "/appointments/new/ok",})
public class SvAppointments extends HttpServlet {

    AppointmentService appointmentService = new AppointmentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo != null) {
            Integer appointmentID = PathUtils.isPathInfoID(pathInfo);

            if (appointmentID != null) {
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
            } else if (servletPath.contains("reset")) {
                request.getSession(false).removeAttribute("appointmentPatient");
                request.getSession(false).removeAttribute("appointmentHour");
                request.getSession(false).removeAttribute("appointmentDate");
                request.getSession(false).removeAttribute("professional");
                request.getSession(false).removeAttribute("patientList");
                request.getSession(false).removeAttribute("availableOdontologists");

                response.sendRedirect(request.getContextPath() + "/appointments/new/patient");
            } else {
                appointmentService.getAllAppointments(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo != null) {
            Integer appointmentID = PathUtils.isPathInfoID(pathInfo);

            if (appointmentID != null) {
                appointmentService.getAppointmentInfo(request, response, appointmentID);
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
}

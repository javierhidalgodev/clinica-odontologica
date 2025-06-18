package com.javierhidalgodev.clinicaodontologica.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javierhidalgodev.clinicaodontologica.services.AppointmentService;
import com.javierhidalgodev.clinicaodontologica.utils.PathUtils;

@WebServlet(name = "SvAppointments", urlPatterns = {
    "/appointments",
    "/appointments/*",})
public class SvAppointments extends HttpServlet {

    AppointmentService appointmentService = new AppointmentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo == null) {
            appointmentService.getAllAppointments(request, response);
            return;
        }

        if (PathUtils.isPathInfoID(pathInfo) != null) {
            String queryParams = request.getQueryString();
//            TODO: De momento no existe opción de editar cita
            if (queryParams != null) {
//                if (queryParams.equals("editing=true")) {
//                    appointmentService.editinAppointment(request, response, PathUtils.isPathInfoID(pathInfo))
//                } else {
                   response.sendRedirect(request.getContextPath() + "/appointments" + pathInfo);
                   return;
//                }
            }
            
            appointmentService.getAppointmentInfo(request, response, PathUtils.isPathInfoID(pathInfo));
            return;
        }

        if (pathInfo.substring(1).split("/").length == 2 && pathInfo.substring(1).split("/")[0].equals("new")) {
            String pathNew = pathInfo.substring(1).split("/")[1];

            if (pathNew.equals("patient")) {
                appointmentService.handleAppointmentPatient(request, response);
                return;
            } else if (pathNew.equals("professional")) {
                appointmentService.handleAppointmentProfessional(request, response);
                return;
            } else if (pathNew.equals("confirmation")) {
                appointmentService.handleAppointmentCheck(request, response);
                return;
            } else if (pathNew.equals("ok")) {
                appointmentService.handleAppointmentConfirmation(request, response);
                return;
            } else if (pathNew.equals("reset")) {
                request.getSession(false).removeAttribute("appointmentPatient");
                request.getSession(false).removeAttribute("appointmentHour");
                request.getSession(false).removeAttribute("appointmentDate");
                request.getSession(false).removeAttribute("professional");
                request.getSession(false).removeAttribute("patientList");
                request.getSession(false).removeAttribute("availableOdontologists");
            }
        }

        response.sendRedirect(request.getContextPath() + "/appointments/new/patient");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo == null) {
            response.sendRedirect(request.getContextPath() + request.getServletPath());
            return;
        }

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

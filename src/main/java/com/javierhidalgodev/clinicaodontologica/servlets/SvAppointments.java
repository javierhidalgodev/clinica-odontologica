package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Horario;
import com.javierhidalgodev.clinicaodontologica.logica.Paciente;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.javierhidalgodev.clinicaodontologica.servlets.services.AppointmentService;

/**
 *
 * @author Javi
 */
@WebServlet(name = "SvAppointments", urlPatterns = {"/SvAppointments"})
public class SvAppointments extends HttpServlet {

    Controller controller = Controller.getInstance();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession mySession = request.getSession();

        List<Horario> workSchedulesList = controller.getWorkScheduleList();
        List<Paciente> patientList = controller.getAllPatients();

        mySession.setAttribute("workSchedulesList", workSchedulesList);
        mySession.setAttribute("patientList", patientList);

        response.sendRedirect("altaCitaHorario.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String step = request.getParameter("step");
        AppointmentService appointmentService = new AppointmentService();
        
        switch (step) {
            case "1":
                appointmentService.handleAppointmentDate(request, response);
                break;
            case "2":
                appointmentService.handleAppointmentProfessional(request, response);
                break;
            case "3":
                appointmentService.handleAppointmentConfirmation(request, response);
                break;
            default:
                response.sendRedirect("index.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

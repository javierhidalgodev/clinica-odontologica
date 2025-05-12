package com.javierhidalgodev.clinicaodontologica.servlets.services;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Odontologo;
import com.javierhidalgodev.clinicaodontologica.logica.Paciente;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Javi
 */
public class AppointmentService {
    Controller controller = Controller.getInstance();
    
    public void handleAppointmentDate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String date = request.getParameter("appointmentDate");
        String hour = request.getParameter("appointmentHour");
        String patientID = request.getParameter("patient");

        if (date != null && hour != null && patientID != null) {
            int wSAppointment = Integer.parseInt(hour.split(":")[0]);
//            List<Horario> wSList = controller.getWorkScheduleList();
//            Horario wS = null;

            List<Odontologo> odontologist = null;

            // La idea aquí es poder filtrar por los distintos tipos de horarios.
            // Para una prueba "cercana" hemos establecido los dos principales
            // pero la aplicación debería de ser capaz de filtar según todos
            // los horarios.
            if (wSAppointment < 12) {
                odontologist = controller.getOdontologistsByWS(1);
            } else if (wSAppointment >= 12 && wSAppointment < 16) {
                odontologist = controller.getAllOdontologists();
            } else {
                odontologist = controller.getOdontologistsByWS(2);
            }

            int pID = Integer.parseInt(patientID);
            Paciente patient = controller.getPatientById(pID);

            HttpSession mySession = request.getSession();

            mySession.setAttribute("appointmentDate", date);
            mySession.setAttribute("appointmentHour", hour);
            mySession.setAttribute("appointmentPatient", patient);
            mySession.setAttribute("availableOdontologists", odontologist);
            response.sendRedirect("altaCitaOdontologo.jsp");
            return;
        }

        response.sendRedirect("index.jsp");
    }

    public void handleAppointmentProfessional(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String odontoligstID = request.getParameter("odontologist");

        if (odontoligstID != null) {
            int oID = Integer.parseInt(odontoligstID);

            Odontologo odontologist = controller.getOdontologistById(oID);

            HttpSession mySession = request.getSession();

            mySession.setAttribute("professional", odontologist);
            response.sendRedirect("confirmarCita.jsp");
            return;
        }

        response.sendRedirect("index.jsp");
    }

    public void handleAppointmentConfirmation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String date = request.getParameter("appointmentDate");
        String hour = request.getParameter("appointmentHour");
        String professional = request.getParameter("professional");
        String patient = request.getParameter("patient");

        if (date != null && hour != null && professional != null && patient != null) {
            controller.createAppointment(date, hour, professional, patient);

            request.getSession().removeAttribute("appointmentDate");
            request.getSession().removeAttribute("appointmentHour");
            request.getSession().removeAttribute("appointmentPatient");
            request.getSession().removeAttribute("availableOdontologists");
            request.getSession().removeAttribute("professional");
            request.getSession().removeAttribute("patientsList");

            response.sendRedirect("SvAppointmentsView");
            return;
        }

        response.sendRedirect("index.jsp");
    }    
}

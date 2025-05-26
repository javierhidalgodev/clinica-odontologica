package com.javierhidalgodev.clinicaodontologica.servlets.services;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Horario;
import com.javierhidalgodev.clinicaodontologica.logica.Odontologo;
import com.javierhidalgodev.clinicaodontologica.logica.Paciente;
import com.javierhidalgodev.clinicaodontologica.logica.Turno;
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

    public void getAllAppointments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Turno> appointmentList = controller.getAllAppointments();

        request.setAttribute("appointmentList", appointmentList);

        request.getRequestDispatcher("WEB-INF/views/appointmentsView.jsp").forward(request, response);
        return;
    }

    public void getAppointmentInfo(HttpServletRequest request, HttpServletResponse response, String appointmentID) throws ServletException, IOException {
        int id = Integer.parseInt(appointmentID);
        Turno appointment = controller.getAppointmentById(id);

        if(appointment != null) {
            request.setAttribute("appointmentInfo", appointment);

            request.getRequestDispatcher("/WEB-INF/views/appointmentInfoView.jsp").forward(request, response);
            return;
        }
        
        response.sendRedirect(request.getContextPath() + "/index");
    }

    //    appointments/new/patient
    public void handleAppointmentPatient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession mySession = request.getSession();

        List<Horario> workSchedulesList = controller.getWorkScheduleList();
        List<Paciente> patientList = controller.getAllPatients();

        mySession.setAttribute("workScheduleList", workSchedulesList);
        mySession.setAttribute("patientList", patientList);

        request.getRequestDispatcher("/WEB-INF/views/appointmentRegisterPatientView.jsp").forward(request, response);
        return;
    }

    //    appointments/new/professional
    public void handleAppointmentProfessional(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getMethod();

        if (method.equals("POST")) {
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

                request.getRequestDispatcher("/WEB-INF/views/appointmentRegisterOdontologistView.jsp").forward(request, response);
                return;
            }
        } else {
            String date = (String) request.getSession().getAttribute("appointmentDate");
            String hour = (String) request.getSession().getAttribute("appointmentHour");
            Paciente patient = (Paciente) request.getSession().getAttribute("appointmentPatient");

            if (date != null && hour != null && patient != null) {
                request.getRequestDispatcher("/WEB-INF/views/appointmentRegisterOdontologistView.jsp").forward(request, response);
                return;
            } else {
                response.sendRedirect(request.getContextPath() + "/appointments/new/patient");
            }
        }
    }

    //    appointments/new/confirmation
    public void handleAppointmentCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getMethod();

        if (method.equals("POST")) {
            String odontoligstID = request.getParameter("odontologist");

            if (odontoligstID != null) {
                int oID = Integer.parseInt(odontoligstID);

                Odontologo odontologist = controller.getOdontologistById(oID);

                HttpSession mySession = request.getSession();

                mySession.setAttribute("professional", odontologist);

                request.getRequestDispatcher("/WEB-INF/views/appointmentRegisterConfirmView.jsp").forward(request, response);
                return;
            }

            response.sendRedirect(request.getContextPath() + "/index");
        } else {

            Odontologo professional = (Odontologo) request.getSession().getAttribute("professional");

            if (professional != null) {
                request.getRequestDispatcher("/WEB-INF/views/appointmentRegisterConfirmView.jsp").forward(request, response);
                return;
            }

            response.sendRedirect(request.getContextPath() + "/index");
        }
    }

//    appointments/new/confirmation
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

            response.sendRedirect(request.getContextPath() + "/appointments");
        } else {
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }
}

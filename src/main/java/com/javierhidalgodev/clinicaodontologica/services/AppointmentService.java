package com.javierhidalgodev.clinicaodontologica.services;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
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

public class AppointmentService {

    Controller controller = Controller.getInstance();

    public void getAllAppointments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession mySession = request.getSession();
        UserDTO userSession = (UserDTO) mySession.getAttribute("userSession");
        List<Turno> appointmentList = null;

        if (userSession.getRole() != null && userSession.getRole().equals("admin")) {
            appointmentList = controller.getAllAppointments();
        } else {
            if (userSession.getProfessional() == null) {
                response.sendRedirect(request.getContextPath() + "/index");
                return;
            }

            if (userSession.getProfessional() instanceof Odontologo) {
                appointmentList = controller.getAppointmentsByOdontologist(userSession.getProfessional().getId());
            } else {
                appointmentList = controller.getAllAppointments();
            }
        }

        mySession.setAttribute("appointmentList", appointmentList);

        request.getRequestDispatcher("WEB-INF/views/appointmentsView.jsp").forward(request, response);
        return;
    }

    public void getAppointmentInfo(HttpServletRequest request, HttpServletResponse response, int appointmentID) throws ServletException, IOException {
        HttpSession mySession = request.getSession();
        UserDTO userSession = (UserDTO) mySession.getAttribute("userSession");
        List<Turno> appointmentList = (List<Turno>) mySession.getAttribute("appointmentList");
        Turno appointment = controller.getAppointmentById(appointmentID);

        System.out.println("VOY A CONSEGUIR LA CITA POR ID");

        if (userSession != null && userSession.getRole().equals("user")) {
            System.out.println("SOY UN USER");

            boolean isMyAppointment = false;
            for (Turno t : appointmentList) {
                if (t.getIdAppointment() == appointmentID) {
                    isMyAppointment = true;
                    break;
                }
            }

            if (isMyAppointment) {
                System.out.println("Y ES MI CITA");
                request.setAttribute("appointmentInfo", appointment);
                request.getRequestDispatcher("/WEB-INF/views/appointmentInfoView.jsp").forward(request, response);
                return;
            }

            System.out.println("PERO NO ES MI CITA");
            response.sendRedirect(request.getContextPath() + "/appointments");
            return;
        }

        System.out.println("SOY UN ADMIN");
        if (appointment != null) {
            System.out.println("Y RECUPERO LA CITA");
            request.setAttribute("appointmentInfo", appointment);

            request.getRequestDispatcher("/WEB-INF/views/appointmentInfoView.jsp").forward(request, response);
            return;
        }

        System.out.println("PERO LA CITA NO EXISTE");
        response.sendRedirect(request.getContextPath() + "/appointments");
        return;
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
        }

        response.sendRedirect(request.getContextPath() + "/appointments/new/patient");
        return;
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
        }
        
        response.sendRedirect(request.getContextPath() + "/appointments/new/patient");
        return;
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
            request.getSession().removeAttribute("patientList");

            response.sendRedirect(request.getContextPath() + "/appointments");
            return;
        } else {
            response.sendRedirect(request.getContextPath() + "/index");
            return;
        }
    }
}

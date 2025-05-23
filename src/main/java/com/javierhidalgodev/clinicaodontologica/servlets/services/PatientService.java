package com.javierhidalgodev.clinicaodontologica.servlets.services;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Paciente;
import com.javierhidalgodev.clinicaodontologica.logica.Responsable;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PatientService {

    Controller controller = Controller.getInstance();

    public void getAllPatients(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession mySession = request.getSession();
        UserDTO userSession = (UserDTO) mySession.getAttribute("userSession");
        List<Paciente> patientsList = null;

        if (userSession.getRole() != null && userSession.getRole().equals("admin")) {
            patientsList = controller.getAllPatients();
        } else {
            if (userSession.getProfessional() != null) {
                if (userSession.getProfessional().equals("odontologist")) {
                    patientsList = controller.getPatientsByOdontologist(userSession.getId());
                } else {
                    patientsList = controller.getAllPatients();
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/index");
            }
        }

        mySession.setAttribute("patientsList", patientsList);
        request.getRequestDispatcher("WEB-INF/views/vistaPacientes.jsp").forward(request, response);
    }

    public void getInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");

        if (id != null && id.matches("\\d+")) {
            int patientID = Integer.parseInt(id);

            Paciente patient = controller.getPatientById(patientID);

            if (patient != null) {
                HttpSession mySession = request.getSession();
                mySession.setAttribute("patientDetails", patient);
                request.getRequestDispatcher("WEB-INF/views/vistaPaciente.jsp").forward(request, response);
                return;
            } else {
                response.sendRedirect("patients");
            }
        } else {
            response.sendRedirect("patients");
        }
    }

    public void createPatient(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String patientFirstName = request.getParameter("patientFirstName");
        String patientSurname = request.getParameter("patientSurname");
        String patientAddress = request.getParameter("patientAddress");
        String patientPhone = request.getParameter("patientPhone");
        String patientBirthdate = request.getParameter("patientBirthdate");
        String patientDNI = request.getParameter("patientDNI");
        String prepaidHealth = request.getParameter("prepaidHealth");
        String bloodType = request.getParameter("bloodType");

        LocalDate today = LocalDate.now();
        LocalDate birth = LocalDate.parse(patientBirthdate);
        Period period = Period.between(birth, today);

        if (period.getYears() < 18) {
            String guardianFirstName = request.getParameter("guardianFirstName");
            String guardianSurname = request.getParameter("guardianSurname");
            String guardianAddress = request.getParameter("guardianAddress");
            String guardianPhone = request.getParameter("guardianPhone");
            String guardianBirthdate = request.getParameter("guardianBirthdate");
            String guardianDNI = request.getParameter("guardianDNI");
            String relationship = request.getParameter("relationship");

            Date guardianBirth = Date.valueOf(guardianBirthdate);

            Responsable guardian = new Responsable(relationship, guardianFirstName, guardianSurname, guardianPhone, guardianAddress, guardianBirth, guardianDNI);

            controller.createPatient(patientFirstName, patientSurname, patientAddress, patientPhone, birth, patientDNI, prepaidHealth, bloodType, guardian);
        } else {
            controller.createPatient(patientFirstName, patientSurname, patientAddress, patientPhone, birth, patientDNI, prepaidHealth, bloodType, null);
        }

        response.sendRedirect("patients");
    }

    public void deletePatient(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String patientIdToDelete = request.getParameter("id");

        if (patientIdToDelete != null && !patientIdToDelete.isEmpty()) {

            int patientID = Integer.parseInt(patientIdToDelete);
            controller.destroyPatient(patientID);

            response.sendRedirect("patients");
        }
    }

    public void editingPatient(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO: revisar esta redirección que se está haciendo por GET
        request.getRequestDispatcher("WEB-INF/views/edicionPaciente.jsp").forward(request, response);
    }

    public void editPatient(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession mySession = request.getSession();
        Paciente patientToEdit = (Paciente) mySession.getAttribute("patientDetails");

        String patientFirstName = request.getParameter("patientFirstName");
        String patientSurname = request.getParameter("patientSurname");
        String patientAddress = request.getParameter("patientAddress");
        String patientPhone = request.getParameter("patientPhone");
        String patientBirthdate = request.getParameter("patientBirthdate");
        String prepaidHealth = request.getParameter("prepaidHealth");
        String bloodType = request.getParameter("bloodType");

        LocalDate today = LocalDate.now();
        LocalDate birth = LocalDate.parse(patientBirthdate);
        Period period = Period.between(birth, today);

        if (patientToEdit.getGuardian() == null && period.getYears() < 18) {
            String guardianFirstName = request.getParameter("guardianFirstName");
            String guardianSurname = request.getParameter("guardianSurname");
            String guardianAddress = request.getParameter("guardianAddress");
            String guardianPhone = request.getParameter("guardianPhone");
            String guardianBirthdate = request.getParameter("guardianBirthdate");
            String guardianDNI = request.getParameter("guardianDNI");
            String relationship = request.getParameter("relationship");

            Responsable guardian = controller.createGuardian(guardianFirstName, guardianSurname, guardianAddress, guardianPhone, guardianBirthdate, guardianDNI, relationship);

            controller.editPatient(patientToEdit, patientFirstName, patientSurname, patientAddress, patientPhone, birth, prepaidHealth, bloodType, guardian);
        } else {
            controller.editPatient(patientToEdit, patientFirstName, patientSurname, patientAddress, patientPhone, birth, prepaidHealth, bloodType, null);
        }

        response.sendRedirect("patients?id=" + patientToEdit.getId());
    }
}

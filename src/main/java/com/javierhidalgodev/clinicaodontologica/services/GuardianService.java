package com.javierhidalgodev.clinicaodontologica.services;

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

public class GuardianService {

    Controller controller = Controller.getInstance();

    public void getAllGuardians(HttpServletRequest request, HttpServletResponse response)
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
        request.getRequestDispatcher("WEB-INF/views/patientsView.jsp").forward(request, response);
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
                request.getRequestDispatcher("WEB-INF/views/patientInfoView.jsp").forward(request, response);
                return;
            } else {
                response.sendRedirect("patients");
            }
        } else {
            response.sendRedirect("patients");
        }
    }

    public void createGuardian(HttpServletRequest request, HttpServletResponse response)
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

    public void deleteGuardian(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession mySession = request.getSession();
        Paciente patient = (Paciente) mySession.getAttribute("patientDetails");

        String guardianIdToDelete = request.getParameter("guardianIdToDelete");

        if (patient != null && guardianIdToDelete != null && !guardianIdToDelete.isEmpty()) {
            int guardianID = Integer.parseInt(guardianIdToDelete);
            controller.destroyGuardian(patient, guardianID);
            response.sendRedirect("patients?id=" + patient.getId());
        }
    }

    public void editingGuardian(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/views/guardianEditView.jsp").forward(request, response);
    }

    public void editGuardian(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession mySession = request.getSession();
        Paciente patientToEdit = (Paciente) mySession.getAttribute("patientDetails");
        Responsable guardian = patientToEdit.getGuardian();

        String firstName = request.getParameter("firstName");
        String surname = request.getParameter("surname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String birthdate = request.getParameter("birthdate");
        String relationship = request.getParameter("relationship");

        LocalDate birth = LocalDate.parse(birthdate);

        controller.editGuardian(guardian, firstName, surname, address, phone, birthdate, relationship);

        response.sendRedirect("patients?id=" + patientToEdit.getId());
    }

}

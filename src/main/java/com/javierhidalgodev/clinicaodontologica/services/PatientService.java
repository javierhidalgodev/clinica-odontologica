package com.javierhidalgodev.clinicaodontologica.services;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Odontologo;
import com.javierhidalgodev.clinicaodontologica.logica.Paciente;
import com.javierhidalgodev.clinicaodontologica.logica.Responsable;
import com.javierhidalgodev.clinicaodontologica.utils.PathUtils;
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

    public void doAction(String pathInfo, String action, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (pathInfo.equals("/new")) {
            createPatient(request, response);
        }

        Integer patientID = PathUtils.isPathInfoID(pathInfo);

        if (patientID != null) {
            if (action.equals("edit")) {
                editPatient(request, response, patientID);
            }

            if (action.equals("delete")) {
                deletePatient(request, response);
            }
        }
    }

    public void getAllPatients(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession mySession = request.getSession();
        UserDTO userSession = (UserDTO) mySession.getAttribute("userSession");
        List<Paciente> patientsList = null;

        if (userSession.getRole() != null && userSession.getRole().equals("admin")) {
            System.out.println("SOY ADMIN. OBTENGO TODOS LOS PACIENTES");
            patientsList = controller.getAllPatients();
        } else {
            System.out.println("SOY USER");

            if (userSession.getProfessional() == null) {
                response.sendRedirect(request.getContextPath() + "/index");
                return;
            }

            if (userSession.getProfessional() instanceof Odontologo) {
                System.out.println("SOY ODONTÓLOGO Y RECUPERO MIS PACIENTES");

                patientsList = controller.getPatientsByOdontologist(userSession.getProfessional().getId());
            } else {
                System.out.println("SOY SECRETARIO Y OBTENGO TODOS LOS PACIENTES");

                patientsList = controller.getAllPatients();
            }
        }

        mySession.setAttribute("patientsList", patientsList);
        request.getRequestDispatcher("/WEB-INF/views/patientsView.jsp").forward(request, response);
        return;
    }

    public void getInfo(HttpServletRequest request, HttpServletResponse response, int patientID)
            throws ServletException, IOException {
        HttpSession mySession = request.getSession();
        UserDTO userSession = (UserDTO) mySession.getAttribute("userSession");
        List<Paciente> patienstList = (List<Paciente>) mySession.getAttribute("patientsList");
        Paciente patient = controller.getPatientById(patientID);

        if (userSession != null && userSession.getRole().equals("user")) {
            boolean isMyPatient = false;
            for (Paciente p : patienstList) {
                if (p.getId() == patientID) {
                    isMyPatient = true;
                    break;
                }
            }

            if (isMyPatient) {
                request.setAttribute("patient", patient);
                System.out.println("SOY USER " + userSession.getProfessional().getClass().getSimpleName() + " Y ESTE ES MI PACIENTE");

                request.getRequestDispatcher("/WEB-INF/views/patientInfoView.jsp").forward(request, response);
                return;
            }

            System.out.println("SOY USER PERO ESTE NO ES MI PACIENTE");
            response.sendRedirect(request.getContextPath() + "/patients");
            return;
        }

        if (patient != null) {
            request.setAttribute("patient", patient);

            System.out.println("SOY ADMIN Y RECUPERO MI PACIENTE");
            request.getRequestDispatcher("/WEB-INF/views/patientInfoView.jsp").forward(request, response);
            return;
        }

        response.sendRedirect(request.getContextPath() + "/patients");
        return;
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

        response.sendRedirect(request.getContextPath() + "/patients");
    }

    public void deletePatient(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String patientIdToDelete = request.getParameter("id");

        System.out.println("ELIMINANDO PACIENTE");

        if (patientIdToDelete != null && !patientIdToDelete.isEmpty()) {

            int patientID = Integer.parseInt(patientIdToDelete);
            controller.destroyPatient(patientID);

            response.sendRedirect(request.getContextPath() + "/patients");
        }
    }

    public void editingPatient(HttpServletRequest request, HttpServletResponse response, Integer patientID)
            throws ServletException, IOException {
        Paciente patientToEdit = controller.getPatientById(patientID);
        request.setAttribute("patient", patientToEdit);

        System.out.println("EDITANDO...");

        request.getRequestDispatcher("/WEB-INF/views/patientEditView.jsp").forward(request, response);
        return;
    }

    public void editPatient(HttpServletRequest request, HttpServletResponse response, Integer patientID)
            throws ServletException, IOException {
        Paciente patientToEdit = (Paciente) controller.getPatientById(patientID);

        String patientFirstName = request.getParameter("patientFirstName");
        String patientSurname = request.getParameter("patientSurname");
        String patientAddress = request.getParameter("patientAddress");
        String patientPhone = request.getParameter("patientPhone");
        String patientBirthdate = request.getParameter("patientBirthdate");
        String prepaidHealth = request.getParameter("prepaidHealth");
        String bloodType = request.getParameter("bloodType");

        if (patientFirstName == null || patientSurname == null || patientAddress == null || patientPhone == null || patientBirthdate == null || prepaidHealth == null || bloodType == null) {
            System.out.println("NECESITO LA DATA DEL PACIENTE, Y NO ME LA DAS COMPLETA. PUES ME VOY");
            response.sendRedirect(request.getContextPath() + "/patients");
            return;
        }

        LocalDate today = LocalDate.now();
        LocalDate birth = LocalDate.parse(patientBirthdate);
        Period period = Period.between(birth, today);
        System.out.println(period.getYears());

        if (patientToEdit.getGuardian() == null && period.getYears() < 18) {
            System.out.println("EL PACIENTE ES MENOR DE EDAD Y NECESITA RESPONSABLE");

            String guardianFirstName = request.getParameter("guardianFirstName");
            String guardianSurname = request.getParameter("guardianSurname");
            String guardianAddress = request.getParameter("guardianAddress");
            String guardianPhone = request.getParameter("guardianPhone");
            String guardianBirthdate = request.getParameter("guardianBirthdate");
            String guardianDNI = request.getParameter("guardianDNI");
            String relationship = request.getParameter("relationship");

            if (guardianFirstName == null || guardianSurname == null || guardianAddress == null || guardianPhone == null || guardianBirthdate == null || guardianDNI == null || relationship == null) {
                System.out.println("NECESITO LA DATA DEL RESPONSABLE, Y NO ME LA DAS. PUES ME VOY");
                response.sendRedirect(request.getContextPath() + "/patients");
                return;
            }

            Responsable guardian = controller.createGuardian(guardianFirstName, guardianSurname, guardianAddress, guardianPhone, guardianBirthdate, guardianDNI, relationship);

            controller.editPatient(patientToEdit, patientFirstName, patientSurname, patientAddress, patientPhone, birth, prepaidHealth, bloodType, guardian);
            System.out.println("EDITANDO PACIENTE CON RESPONSABLE");
        } else {
            controller.editPatient(patientToEdit, patientFirstName, patientSurname, patientAddress, patientPhone, birth, prepaidHealth, bloodType, null);
            System.out.println("EDITANDO PACIENTE");
        }

        System.out.println("PACIENTE EDITADO");
        response.sendRedirect(request.getContextPath() + "/patients");
    }
}

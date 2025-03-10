package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Paciente;
import com.javierhidalgodev.clinicaodontologica.logica.Responsable;
import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Javi
 */
@WebServlet(name = "SvPatientsEdit", urlPatterns = {"/SvPatientsEdit"})
public class SvPatientsEdit extends HttpServlet {

    Controller controller = Controller.getInstance();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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

        controller.editPatient(patientToEdit, patientFirstName, patientSurname, patientAddress, patientPhone, patientBirthdate, prepaidHealth, bloodType);

        response.sendRedirect("SvPatients");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

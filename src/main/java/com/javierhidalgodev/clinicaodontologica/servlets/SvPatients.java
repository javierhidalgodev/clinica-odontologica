package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Responsable;
import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Javi
 */
@WebServlet(name = "SvPatients", urlPatterns = {"/SvPatients"})
public class SvPatients extends HttpServlet {

    Controller controller = new Controller();

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

            Responsable guardian = controller.createGuardian(guardianFirstName, guardianSurname, guardianAddress, guardianPhone, guardianBirthdate, guardianDNI, relationship);

            controller.createPatient(patientFirstName, patientSurname, patientAddress, patientPhone, birth, patientDNI, prepaidHealth, bloodType, guardian);
        } else {
            controller.createPatient(patientFirstName, patientSurname, patientAddress, patientPhone, birth, patientDNI, prepaidHealth, bloodType, null);
        }

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

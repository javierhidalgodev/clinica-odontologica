package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Odontologo;
import java.io.IOException;
import java.time.LocalDate;
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
@WebServlet(name = "SvAppointmentConfirmation", urlPatterns = {"/SvAppointmentConfirmation"})
public class SvAppointmentConfirmation extends HttpServlet {

    Controller controller = Controller.getInstance();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession mySession = request.getSession();
        String odontoligstID = request.getParameter("odontologist");

        if (odontoligstID != null) {
            int oID = Integer.parseInt(odontoligstID);

            Odontologo odontologist = controller.getOdontologistById(oID);
            mySession.setAttribute("professional", odontologist);
            response.sendRedirect("confirmarCita.jsp");
            return;
        }

        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String date = request.getParameter("appointmentDate");
        String hour = request.getParameter("appointmentHour");
        String professional = request.getParameter("professional");
        String patient = request.getParameter("patient");

        if (date != null && hour != null && professional != null && patient != null) {
            controller.createAppointment(date, hour, professional, patient);

            request.getSession().removeAttribute("appointmentDate");
            request.getSession().removeAttribute("appointmentHour");
            request.getSession().removeAttribute("odonotlogist");
            request.getSession().removeAttribute("appointmentPatient");
            request.getSession().removeAttribute("availableOdontologists");
            request.getSession().removeAttribute("patientsList");

            response.sendRedirect("SvAppointmentsView");
            return;
        }

        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

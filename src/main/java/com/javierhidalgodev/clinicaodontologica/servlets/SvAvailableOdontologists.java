package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Horario;
import com.javierhidalgodev.clinicaodontologica.logica.Odontologo;
import com.javierhidalgodev.clinicaodontologica.logica.Paciente;
import java.io.IOException;
import java.util.List;
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
@WebServlet(name = "SvAvailableOdontologists", urlPatterns = {"/SvAvailableOdontologists"})
public class SvAvailableOdontologists extends HttpServlet {

    Controller controller = Controller.getInstance();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession mySession = request.getSession();
        
        String date = request.getParameter("appointmentDate");
        String hour = request.getParameter("appointmentHour");
        String patientID = request.getParameter("patient");

        if (date != null && hour != null && patientID != null) {
            int wSAppointment = Integer.parseInt(hour.split(":")[0]);
            List<Horario> wSList = controller.getWorkScheduleList();
            Horario wS = null;
            
            List<Odontologo> odontologist = null;

            // La idea aquí es poder filtrar por los distintos tipos de horarios.
            // Para una prueba "cercana" hemos establecido los dos principales
            // pero la aplicación debería de ser capaz de filtar según todos
            // los horarios.
            if(wSAppointment < 12) {
                odontologist = controller.getOdontologistsByWS(1);
            } else if(wSAppointment >= 12 && wSAppointment < 16) {
                odontologist = controller.getAllOdontologists();
            } else {
                odontologist = controller.getOdontologistsByWS(2);
            }
            
            int pID = Integer.parseInt(patientID);
            Paciente patient = controller.getPatientById(pID);
            
            mySession.setAttribute("appointmentDate", date);
            mySession.setAttribute("appointmentHour", hour);
            mySession.setAttribute("appointmentPatient", patient);
            mySession.setAttribute("availableOdontologists", odontologist);
            response.sendRedirect("altaCitaOdontologo.jsp");
            return;
        }

        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

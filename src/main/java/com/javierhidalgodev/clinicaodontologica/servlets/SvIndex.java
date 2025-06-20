package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import java.io.IOException;
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
@WebServlet(name = "SvIndex", urlPatterns = {"/index"})
public class SvIndex extends HttpServlet {

    Controller controller = Controller.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int odontologistsCount = controller.getOdontologistsCount();
            int secretariesCount = controller.getSecretariesCount();
            int patientsCount = controller.getPatientsCount();
            int appointmentsCount = controller.getAppointmentsCount();
            
            HttpSession mySession = request.getSession();
            mySession.setAttribute("odontologistsCount", String.valueOf(odontologistsCount));
            mySession.setAttribute("secretariesCount", String.valueOf(secretariesCount));
            mySession.setAttribute("patientsCount", String.valueOf(patientsCount));
            mySession.setAttribute("appointmentsCount", String.valueOf(appointmentsCount));

            request.getRequestDispatcher("WEB-INF/views/index.jsp").forward(request, response);
            return;
        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}

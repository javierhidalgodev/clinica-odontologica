package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Turno;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Javi
 */
@WebServlet(name = "SvAppointmentInfo", urlPatterns = {"/SvAppointmentInfo"})
public class SvAppointmentInfo extends HttpServlet {

    Controller controller = Controller.getInstance();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String appointmentID = request.getParameter("appointmentID");
//        String pathInfo = request.getPathInfo();

//        if (pathInfo != null && !pathInfo.isEmpty()) {
        if(appointmentID != null && !appointmentID.isEmpty()) {

//            int id = Integer.parseInt(pathInfo.substring(1));
            int id = Integer.parseInt(appointmentID);
            Turno appointment = controller.getAppointmentById(id);

//            if (appointment != null) {
                // Vamos a probar a setearlo en la request del navegador, no en la sesión
                
                request.setAttribute("appointmentInfo", appointment);

                RequestDispatcher dispatcher = request.getRequestDispatcher("vistaCitaInfo.jsp");
                dispatcher.forward(request, response);
//                response.sendRedirect("vistaCitaInfo.jsp");
                return;
//            }
            
//            response.sendRedirect("index.jsp");
//            return;
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

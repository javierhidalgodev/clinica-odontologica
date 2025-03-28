package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Odontologo;
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
@WebServlet(name = "SvOdontologistInfo", urlPatterns = {"/SvOdontologistInfo"})
public class SvOdontologistInfo extends HttpServlet {

    Controller controller = Controller.getInstance();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String odontoID = request.getParameter("idToInfo");

        if (odontoID != null && !odontoID.isEmpty()) {
            int odontologistID = Integer.parseInt(odontoID);
            
            Odontologo odontologist = controller.getOdontologistById(odontologistID);

            System.out.println("Desde SVOdontologistInfo número de citas: " + odontologist.getWorkShift().size());
            
            request.setAttribute("odontologist", odontologist);

            RequestDispatcher dispatcher = request.getRequestDispatcher("vistaOdontologoInfo.jsp");
            dispatcher.forward(request, response);
//            response.sendRedirect("vistaOdontologos.jsp");
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

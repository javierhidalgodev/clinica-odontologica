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
        String pathInfo = request.getPathInfo();
        System.out.println(pathInfo);
        
        if (pathInfo != null && pathInfo.matches("/\\d+")) {
            int odontologistID = Integer.parseInt(pathInfo.substring(1));

            Odontologo odontologist = controller.getOdontologistById(odontologistID);

            System.out.println("Desde SVOdontologistInfo número de citas: " + odontologist.getWorkShift().size());

            request.setAttribute("odontologist", odontologist);

            request.getRequestDispatcher("/vistaOdontologoInfo.jsp").forward(request, response);
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

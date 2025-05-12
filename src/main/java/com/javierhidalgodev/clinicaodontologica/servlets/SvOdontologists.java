package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Odontologo;
import com.javierhidalgodev.clinicaodontologica.servlets.services.OdontologistService;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Javi
 */
@WebServlet(name = "SvOdontologists", urlPatterns = {"/SvOdontologists"})
public class SvOdontologists extends HttpServlet {

    Controller controller = Controller.getInstance();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Odontologo> odontologistsList = controller.getAllOdontologists();
        
        request.setAttribute("odontologistsList", odontologistsList);
        
        request.getRequestDispatcher("vistaOdontologos.jsp").forward(request, response);
        return;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OdontologistService odontologistService = new OdontologistService();
        String operation = request.getParameter("operation");
        
        switch (operation) {
            case "create":
                odontologistService.createOdontologist(request, response);
                break;
            case "edit":
                odontologistService.editOdontologist(request, response);
                break;
            case "delete":
                odontologistService.deleteOdontologist(request, response);
                break;
            default:
                response.sendRedirect("index.jsp");
        }        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

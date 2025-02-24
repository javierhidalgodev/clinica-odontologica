package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Odontologo;
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
@WebServlet(name = "SvOdontologist", urlPatterns = {"/SvOdontologist"})
public class SvOdontologist extends HttpServlet {

    Controller controller = new Controller();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Odontologo> odontologistsList = controller.getAllOdontologists();
        
        request.getSession().setAttribute("odontologistsList", odontologistsList);

        response.sendRedirect("vistaOdontologos.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String firstName = request.getParameter("firstName");
        String surname = request.getParameter("surname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String specialization = request.getParameter("specialization");
        String dni = request.getParameter("dni");
        String birthday = request.getParameter("birthday");
        String workShedule = request.getParameter("workSchedule");
        
        controller.createOdontologist(firstName, surname, address, phone, birthday, dni, specialization, workShedule);
        
        response.sendRedirect("SvOdontologists");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

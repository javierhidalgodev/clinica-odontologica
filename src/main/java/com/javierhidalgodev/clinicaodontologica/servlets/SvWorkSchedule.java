package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Horario;
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
@WebServlet(name = "SvWorkSchedule", urlPatterns = {"/SvWorkSchedule"})
public class SvWorkSchedule extends HttpServlet {

    Controller controller = Controller.getInstance();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Horario> workSchedulesList = controller.getWorkScheduleList();
        
        HttpSession mySession = request.getSession();
        mySession.setAttribute("workSchedulesList", workSchedulesList);
        
        response.sendRedirect("vistaHorarios.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String wsName = request.getParameter("WSName");
        String entryTime = request.getParameter("entryTime");
        String exitTime = request.getParameter("exitTime");
        
        controller.createWorkSchedule(wsName, entryTime, exitTime);
        
        response.sendRedirect("SvWorkSchedule");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

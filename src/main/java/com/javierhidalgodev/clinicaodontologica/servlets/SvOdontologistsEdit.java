package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Horario;
import com.javierhidalgodev.clinicaodontologica.logica.Odontologo;
import com.javierhidalgodev.clinicaodontologica.logica.Turno;
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
@WebServlet(name = "SvOdontologistsEdit", urlPatterns = {"/SvOdontologistsEdit"})
public class SvOdontologistsEdit extends HttpServlet {

    Controller controller = Controller.getInstance();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String odontologistIdToEdit = request.getParameter("idToEdit");

        if (odontologistIdToEdit != null && !odontologistIdToEdit.isEmpty()) {
            int odontologistId = Integer.parseInt(odontologistIdToEdit);
            Odontologo odontologistToEdit = controller.getOdontologistById(odontologistId);
            List<UserDTO> userList = controller.getAllFreeUsers();
            
            HttpSession mySession = request.getSession();
            mySession.setAttribute("odontologistToEdit", odontologistToEdit);
            mySession.setAttribute("freeUserList", userList);
            
            List<Turno> turnos = odontologistToEdit.getWorkShift();
            System.out.println("Cantidad de citas en SvOdontoligstEdit.java: " + turnos.size());
            
            if (request.getSession().getAttribute("workSchedulesList") == null) {
                List<Horario> workScheduleList = controller.getWorkScheduleList();
                
                mySession.setAttribute("workSchedulesList", workScheduleList);
            }

            response.sendRedirect("edicionOdontologo.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String surname = request.getParameter("surname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String birthdate = request.getParameter("birthdate");
        String specialization = request.getParameter("specialization");
        String workSchedule = request.getParameter("workSchedule");
        String user = request.getParameter("user");

        Odontologo odontologistToEdit = (Odontologo) request.getSession().getAttribute("odontologistToEdit");
        
        controller.editOdontologist(odontologistToEdit, firstName, surname, address, phone, birthdate, specialization, workSchedule, user);
        request.removeAttribute("odontologistToEdit");

        response.sendRedirect("SvOdontologists");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

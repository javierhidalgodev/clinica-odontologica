package com.javierhidalgodev.clinicaodontologica.servlets.services;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Horario;
import com.javierhidalgodev.clinicaodontologica.logica.Odontologo;
import com.javierhidalgodev.clinicaodontologica.logica.Turno;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Javi
 */
public class OdontologistService {

    Controller controller = Controller.getInstance();

    public void getAllOdontologists(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Odontologo> odontologistList = controller.getAllOdontologists();

        request.setAttribute("odontologistList", odontologistList);

        request.getRequestDispatcher("WEB-INF/views/vistaOdontologos.jsp").forward(request, response);
        return;
    }

    public void getInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        if (id != null && id.matches("\\d+")) {
            int odontologistID = Integer.parseInt(id);

            Odontologo odontologist = controller.getOdontologistById(odontologistID);

            if (odontologist != null) {

                request.setAttribute("odontologist", odontologist);

                request.getRequestDispatcher("/WEB-INF/views/vistaOdontologoInfo.jsp").forward(request, response);
                return;
            } else {
                response.sendRedirect("odontologists");
            }
        } else {
            response.sendRedirect("odontologists");
        }
    }

    public void createOdontologist(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String surname = request.getParameter("surname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String specialization = request.getParameter("specialization");
        String dni = request.getParameter("dni");
        String birthday = request.getParameter("birthday");
        String workSchedule = request.getParameter("workSchedule");

        controller.createOdontologist(firstName, surname, address, phone, birthday, dni, specialization, workSchedule);

        response.sendRedirect(request.getContextPath() + "/odontologists");
    }

    public void editingOdontologist(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String odontologistIdToEdit = request.getParameter("id");
        
        if (odontologistIdToEdit != null && !odontologistIdToEdit.isEmpty()) {
            int odontologistId = Integer.parseInt(odontologistIdToEdit);
            Odontologo odontologistToEdit = controller.getOdontologistById(odontologistId);
            List<UserDTO> userList = controller.getAllFreeUsers();

            HttpSession mySession = request.getSession();
            mySession.setAttribute("odontologistToEdit", odontologistToEdit);
            mySession.setAttribute("freeUserList", userList);

            List<Turno> turnos = odontologistToEdit.getWorkShift();

            if (request.getSession().getAttribute("workScheduleList") == null) {
                List<Horario> workScheduleList = controller.getWorkScheduleList();

                mySession.setAttribute("workScheduleList", workScheduleList);
            }

            request.getRequestDispatcher("WEB-INF/views/edicionOdontologo.jsp").forward(request, response);
            return;
        } else {
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }

    public void editOdontologist(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String surname = request.getParameter("surname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String birthdate = request.getParameter("birthdate");
        String specialization = request.getParameter("specialization");
        String workSchedule = request.getParameter("wSchedule");
        String user = request.getParameter("user");

        Odontologo odontologistToEdit = (Odontologo) request.getSession().getAttribute("odontologistToEdit");

        System.out.println("Name: " + firstName);
        System.out.println("WSID: " + workSchedule);
        
        controller.editOdontologist(odontologistToEdit, firstName, surname, address, phone, birthdate, specialization, workSchedule, user);
        request.removeAttribute("odontologistToEdit");

        response.sendRedirect("odontologists");
    }

    public void deleteOdontologist(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String odontologistIdToDelete = request.getParameter("id");

        if (odontologistIdToDelete != null && !odontologistIdToDelete.isEmpty()) {
            int odontoID = Integer.parseInt(odontologistIdToDelete);

            controller.destroyOdontologist(odontoID);

            response.sendRedirect("odontologists");
        }
    }
}

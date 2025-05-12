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

    public void createOdontologist(HttpServletRequest request, HttpServletResponse response)
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

    public void editOdontologist(HttpServletRequest request, HttpServletResponse response)
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

    public void deleteOdontologist(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String odontologistIdToDelete = request.getParameter("idToDelete");

        if (odontologistIdToDelete != null && !odontologistIdToDelete.isEmpty()) {
            int odontoID = Integer.parseInt(odontologistIdToDelete);

            controller.destroyOdontologist(odontoID);

            response.sendRedirect("SvOdontologists");
        }
    }
}

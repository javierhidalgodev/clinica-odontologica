package com.javierhidalgodev.clinicaodontologica.servlets.services;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Secretario;
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
public class SecretaryService {

    Controller controller = Controller.getInstance();

    public void createSecretary(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String surname = request.getParameter("surname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String floor = request.getParameter("floor");
        String dni = request.getParameter("dni");
        String birthday = request.getParameter("birthday");

        controller.createSecretary(firstName, surname, address, phone, birthday, dni, floor);

        response.sendRedirect("secretaries");
    }

    public void editingSecretary(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String secretaryIdToEdit = request.getParameter("id");

        if (secretaryIdToEdit != null && !secretaryIdToEdit.isEmpty()) {
            int secretaryId = Integer.parseInt(secretaryIdToEdit);
            Secretario secretaryToEdit = controller.getSecretaryById(secretaryId);
            List<UserDTO> userList = controller.getAllFreeUsers();

            HttpSession mySession = request.getSession();
            mySession.setAttribute("secretaryToEdit", secretaryToEdit);
            mySession.setAttribute("freeUserList", userList);

            request.getRequestDispatcher("edicionSecretario.jsp").forward(request, response);
            return;
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    public void editSecretary(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String surname = request.getParameter("surname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String floor = request.getParameter("floor");
        String dni = request.getParameter("dni");
        String birthday = request.getParameter("birthday");
        String user = request.getParameter("user");

        HttpSession mySession = request.getSession();
        Secretario secretaryToEdit = (Secretario) mySession.getAttribute("secretaryToEdit");

        controller.editSecretary(secretaryToEdit, firstName, surname, address, phone, birthday, floor, user);

        request.removeAttribute("secretaryToEdit");
        response.sendRedirect("secretaries");
    }

    public void deleteSecretary(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idUserToDelete = request.getParameter("id");

        if (idUserToDelete != null && !idUserToDelete.isEmpty()) {
            int idSecretary = Integer.parseInt(idUserToDelete);
            controller.destroySecretary(idSecretary);
        }

        response.sendRedirect("secretaries");
    }
}

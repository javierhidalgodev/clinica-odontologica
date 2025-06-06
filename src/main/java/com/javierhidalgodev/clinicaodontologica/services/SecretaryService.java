package com.javierhidalgodev.clinicaodontologica.services;

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

    public void getAllSecretaries(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Secretario> secretariesList = (List<Secretario>) controller.getAllSecretaries();

        HttpSession mySession = request.getSession();
        mySession.setAttribute("secretariesList", secretariesList);

//        response.sendRedirect(request.getContextPath() + "/secretaries");
        request.getRequestDispatcher("WEB-INF/views/secretariesView.jsp").forward(request, response);
        return;
    }

    public void getInfo(HttpServletRequest request, HttpServletResponse response, Integer secretaryID)
            throws ServletException, IOException {
        Secretario secretary = controller.getSecretaryById(secretaryID);

        if (secretary != null) {
            request.setAttribute("secretary", secretary);

            request.getRequestDispatcher("/WEB-INF/views/secretaryInfoView.jsp").forward(request, response);
            return;
        }
        
        response.sendRedirect(request.getContextPath() + "/secretaries");
        return;
    }

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

        response.sendRedirect(request.getContextPath() + "/secretaries");
    }

    public void editingSecretary(HttpServletRequest request, HttpServletResponse response, Integer secretaryID)
            throws ServletException, IOException {
            Secretario secretaryToEdit = controller.getSecretaryById(secretaryID);
            List<UserDTO> userList = controller.getAllFreeUsers();

            HttpSession mySession = request.getSession();
            mySession.setAttribute("secretaryToEdit", secretaryToEdit);
            mySession.setAttribute("freeUserList", userList);

            request.getRequestDispatcher("/WEB-INF/views/secretaryEditView.jsp").forward(request, response);
            return;
    }

    public void editSecretary(HttpServletRequest request, HttpServletResponse response, Integer secretaryID)
            throws ServletException, IOException {
        Secretario secretaryToEdit = controller.getSecretaryById(secretaryID);
        
        String firstName = request.getParameter("firstName");
        String surname = request.getParameter("surname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String floor = request.getParameter("floor");
        String dni = request.getParameter("dni");
        String birthday = request.getParameter("birthday");
        String user = request.getParameter("user");

        controller.editSecretary(secretaryToEdit, firstName, surname, address, phone, birthday, floor, user);

        request.removeAttribute("secretaryToEdit");
        response.sendRedirect(request.getContextPath() + "/secretaries");
    }

    public void deleteSecretary(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idUserToDelete = request.getParameter("id");

        if (idUserToDelete != null && !idUserToDelete.isEmpty()) {
            int idSecretary = Integer.parseInt(idUserToDelete);
            controller.destroySecretary(idSecretary);
        }

        response.sendRedirect(request.getContextPath() + "/secretaries");
    }
}

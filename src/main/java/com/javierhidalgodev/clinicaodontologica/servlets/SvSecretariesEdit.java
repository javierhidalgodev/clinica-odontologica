package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Secretario;
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
@WebServlet(name = "SvSecretariesEdit", urlPatterns = {"/SvSecretariesEdit"})
public class SvSecretariesEdit extends HttpServlet {

    Controller controller = Controller.getInstance();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String secretaryIdToEdit = request.getParameter("idToEdit");

        if (secretaryIdToEdit != null && !secretaryIdToEdit.isEmpty()) {
            int secretaryId = Integer.parseInt(secretaryIdToEdit);
            Secretario secretaryToEdit = controller.getSecretaryById(secretaryId);
            List<UserDTO> userList = controller.getAllFreeUsers();

            HttpSession mySession = request.getSession();
            mySession.setAttribute("secretaryToEdit", secretaryToEdit);
            mySession.setAttribute("freeUserList", userList);

            response.sendRedirect("edicionSecretario.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
        response.sendRedirect("SvSecretaries");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

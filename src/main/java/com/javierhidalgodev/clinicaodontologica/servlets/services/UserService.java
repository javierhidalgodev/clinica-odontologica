package com.javierhidalgodev.clinicaodontologica.servlets.services;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserService {

    Controller controller = Controller.getInstance();

    public void getAllUsers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<UserDTO> users = controller.getAllUsers();

        request.getSession().setAttribute("userList", users);
        request.getRequestDispatcher("WEB-INF/views/vistaUsuarios.jsp").forward(request, response);
    }

    public void getInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");

        if (id != null && id.matches("\\d+")) {
            int userID = Integer.parseInt(id);

            Usuario user = controller.getUserById(userID);

            if (user != null) {
                HttpSession mySession = request.getSession();
                mySession.setAttribute("user", user);
                request.getRequestDispatcher("WEB-INF/views/vistaUsuarioInfo.jsp").forward(request, response);
                return;
            } else {
                response.sendRedirect("users");
            }
        } else {
            response.sendRedirect("users");
        }
    }

    public void createUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = (String) request.getParameter("username");
        String password = (String) request.getParameter("password");
        String role;

        if (request.getParameter("role") != null) {
            role = request.getParameter("role");
        } else {
            role = "NA";
        }

        controller.createUser(username, password, role);

        response.sendRedirect(request.getContextPath() + "/users");
    }

    public void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idUserToDelete = request.getParameter("id");

        if (idUserToDelete != null && !idUserToDelete.isEmpty()) {
            int idUser = Integer.parseInt(idUserToDelete);
            controller.destroyUser(idUser);
        }

        response.sendRedirect("users");
    }

    public void editingUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userIdToEdit = request.getParameter("id");

        if (userIdToEdit != null && !userIdToEdit.isEmpty()) {
            int userId = Integer.parseInt(userIdToEdit);
            Usuario userToEdit = controller.getUserById(userId);

            if (userToEdit != null) {
                request.getSession().setAttribute("userToEdit", userToEdit);
                request.getRequestDispatcher("WEB-INF/views/edicionUsuario.jsp").forward(request, response);
                return;
            } else {
                response.sendRedirect("users");
            }
        } else {
            response.sendRedirect("users");
        }
    }

    public void editUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String role;

        if (request.getParameter("role") != null) {
            role = request.getParameter("role");
        } else {
            role = "NA";
        }

        Usuario userToEdit = (Usuario) request.getSession().getAttribute("userToEdit");
        userToEdit.setRole(role);

        controller.editUser(userToEdit);
        request.removeAttribute("userToEdit");

        response.sendRedirect("users");
    }
}

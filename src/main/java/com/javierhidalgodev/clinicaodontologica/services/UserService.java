package com.javierhidalgodev.clinicaodontologica.services;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Usuario;
import com.javierhidalgodev.clinicaodontologica.utils.PathUtils;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserService {

    Controller controller = Controller.getInstance();

    public void doAction(String pathInfo, String action, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (pathInfo.equals("/new")) {
            createUser(request, response);
        }

        Integer userID = PathUtils.isPathInfoID(pathInfo);

        if (userID != null) {
            if (action.equals("edit")) {
                editUser(request, response, userID);
            }

            if (action.equals("delete")) {
                deleteUser(request, response);
            }
        }
    }

    public void getAllUsers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<UserDTO> users = controller.getAllUsers();

        request.getSession().setAttribute("userList", users);
        request.getRequestDispatcher("/WEB-INF/views/usersView.jsp").forward(request, response);
    }

    public void getInfo(HttpServletRequest request, HttpServletResponse response, int userID)
            throws ServletException, IOException {

        Usuario user = controller.getUserById(userID);

        if (user != null) {
            request.setAttribute("user", user);

            request.getRequestDispatcher("/WEB-INF/views/userInfoView.jsp").forward(request, response);
            return;
        }

        response.sendRedirect(request.getContextPath() + "/users");
        return;
    }

    public void createUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        String username = (String) request.getParameter("username");
        String password = (String) request.getParameter("password");
        String role = (String) request.getParameter("role");

        boolean loggedUser = "/new".equals(pathInfo);
        String contextPath = request.getContextPath();

        if (username == null || password == null || role == null) {
            response.sendRedirect(contextPath + (loggedUser ? "/users" : "/register"));
            return;
        }

        if (controller.userExists(username)) {
            request.setAttribute("userExists", true);

            request.getRequestDispatcher(loggedUser ? "/WEB-INF/views/userRegisterView.jsp" : "/WEB-INF/views/registerView.jsp").forward(request, response);
            return;

        } else {
            controller.createUser(username, password, role);

            response.sendRedirect(contextPath + (loggedUser ? "/users" : "/login"));
            return;
        }

//        response.sendRedirect(request.getContextPath() + "/users");
//        return;
    }

    public void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idUserToDelete = request.getParameter("id");

        if (idUserToDelete != null && !idUserToDelete.isEmpty()) {
            int idUser = Integer.parseInt(idUserToDelete);
            controller.destroyUser(idUser);
        }

        response.sendRedirect(request.getContextPath() + "/users");
    }

    public void editingUser(HttpServletRequest request, HttpServletResponse response, int userID)
            throws ServletException, IOException {
        Usuario userToEdit = controller.getUserById(userID);

        if (userToEdit != null) {
            request.getSession().setAttribute("userToEdit", userToEdit);
            request.getRequestDispatcher("/WEB-INF/views/userEditView.jsp").forward(request, response);
            return;
        }

        response.sendRedirect(request.getContextPath() + "/users");
    }

    public void editUser(HttpServletRequest request, HttpServletResponse response, int userID)
            throws ServletException, IOException {
        String role;

        if (request.getParameter("role") != null) {
            role = request.getParameter("role");
        } else {
            role = "NA";
        }

        Usuario userToEdit = controller.getUserById(userID);
        userToEdit.setRole(role);

        controller.editUser(userToEdit);
        request.removeAttribute("userToEdit");

        response.sendRedirect(request.getContextPath() + "/users");
    }
}

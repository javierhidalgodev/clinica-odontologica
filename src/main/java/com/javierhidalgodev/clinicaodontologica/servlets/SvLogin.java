package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Javi
 */
@WebServlet(name = "SvLogin", urlPatterns = {"/login"})
public class SvLogin extends HttpServlet {

    Controller controller = Controller.getInstance();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/views/loginView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDTO loginSuccessfull = null;

        try {
//            loginSuccessfull = controller.verifyUser(username, password);
            loginSuccessfull = controller.verifyUser(username, password);

            if (loginSuccessfull != null) {
                request.getSession().setAttribute("userSession", loginSuccessfull);
                request.getSession().setAttribute("userRole", loginSuccessfull.getRole());
                request.getSession().setAttribute("userProfessional", loginSuccessfull.getProfessional());
                request.getSession().setAttribute("userName", loginSuccessfull.getUsername());

                response.sendRedirect(request.getContextPath() + "/index");
                return;
            }
            
            response.sendRedirect("error");
            return;
        } catch (Exception e) {
            response.sendRedirect("offline");
            return;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

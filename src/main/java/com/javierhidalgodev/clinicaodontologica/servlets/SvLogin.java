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
@WebServlet(name = "SvLogin", urlPatterns = {"/SvLogin"})
public class SvLogin extends HttpServlet {

    Controller controller = Controller.getInstance();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

                response.sendRedirect("SvIndex");
                return;
            }
            
            response.sendRedirect("error.jsp");
            return;
        } catch (Exception e) {
            response.sendRedirect("offline.jsp");
            return;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

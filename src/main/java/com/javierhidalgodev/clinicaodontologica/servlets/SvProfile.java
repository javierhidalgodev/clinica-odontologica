package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvUserProfile", urlPatterns = {
    "/profile",
    "/profile/*"
})
public class SvProfile extends HttpServlet {

//    Controller controller = Controller.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo == null) {
            HttpSession mySession = request.getSession(false);
            UserDTO userProfile = (UserDTO) mySession.getAttribute("userSession");

            if (userProfile != null) {
                request.getRequestDispatcher("/WEB-INF/views/userProfileView.jsp").forward(request, response);
                return;
            }
        }

        response.sendRedirect(request.getContextPath() + "/profile");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}

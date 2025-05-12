package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Secretario;
import com.javierhidalgodev.clinicaodontologica.servlets.services.SecretaryService;
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
@WebServlet(name = "SvSecretaries", urlPatterns = {"/secretaries"})
public class SvSecretaries extends HttpServlet {

    Controller controller = Controller.getInstance();
    SecretaryService secretaryService = new SecretaryService();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Secretario> secretariesList = (List<Secretario>) controller.getAllSecretaries();

        HttpSession mySession = request.getSession();
        mySession.setAttribute("secretariesList", secretariesList);

        request.getRequestDispatcher("vistaSecretarios.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        System.out.println("estoy aquí: " + action);
        if ("create".equals(action)) {
            secretaryService.createSecretary(request, response);
        } else if ("editing".equals(action)) {
            secretaryService.editingSecretary(request, response);
        } else if ("edit".equals(action)) {
            secretaryService.editSecretary(request, response);
        } else if ("delete".equals(action)) {
            secretaryService.deleteSecretary(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

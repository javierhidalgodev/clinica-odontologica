package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Horario;
import com.javierhidalgodev.clinicaodontologica.logica.Odontologo;
import com.javierhidalgodev.clinicaodontologica.logica.Turno;
import com.javierhidalgodev.clinicaodontologica.servlets.services.OdontologistService;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "SvOdontologistInfo", urlPatterns = {"/odontologist"})
public class SvOdontologistInfo extends HttpServlet {

    Controller controller = Controller.getInstance();
    OdontologistService odontoService = new OdontologistService();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("estoy aquí");

        String idQuery = request.getParameter("id");

        if (idQuery != null && idQuery.matches("\\d+")) {
            int odontologistID = Integer.parseInt(idQuery);

            Odontologo odontologist = controller.getOdontologistById(odontologistID);

            if (odontologist != null) {

                request.setAttribute("odontologist", odontologist);

                request.getRequestDispatcher("/vistaOdontologoInfo.jsp").forward(request, response);
                return;
            }
            
        }
        response.sendRedirect("index.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        System.out.println("estoy aquí");
        if ("delete".equals(action)) {
            odontoService.deleteOdontologist(request, response);
        } else if ("edit".equals(action)) {
            odontoService.editingOdontologist(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.servlets.services.WorkScheduleService;
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
@WebServlet(name = "SvWorkSchedule", urlPatterns = {"/work-schedule", "/work-schedule/new"})
public class SvWorkSchedule extends HttpServlet {

    Controller controller = Controller.getInstance();
    WorkScheduleService workScheduleService = new WorkScheduleService();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String servletPath = request.getServletPath();

        if (servletPath.contains("new")) {
            request.getRequestDispatcher("/WEB-INF/views/workScheduleRegisterView.jsp").forward(request, response);
        } else {
            String queryParams = request.getQueryString();

            if (queryParams == null) {
                // Si no hay query params obtener todos los horarios
                workScheduleService.getAllWorkSchedules(request, response);
            } else {
                // Obtener el param ID y operar condicionalmente
                String id = request.getParameter("id");

                if (id == null) {
                    // El parámetro a consultar no existe
                    // Redirigir al listado de horarios
                    response.sendRedirect("work-schedule");
                } else {
                    // Intentar obtener el horario por id
                    workScheduleService.editingWorkSchedule(request, response);
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("getInfo".equals(action)) {
            workScheduleService.getInfo(request, response);
        } else if ("create".equals(action)) {
            workScheduleService.createWorkSchedule(request, response);
        } else if ("editing".equals(action)) {
            workScheduleService.editingWorkSchedule(request, response);
        } else if ("edit".equals(action)) {
            workScheduleService.editWorkSchedule(request, response);
        } else if ("delete".equals(action)) {
            workScheduleService.deleteWorkSchedule(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

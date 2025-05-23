package com.javierhidalgodev.clinicaodontologica.servlets.services;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Horario;
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
public class WorkScheduleService {

    Controller controller = Controller.getInstance();

    public void getAllWorkSchedules(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Horario> workSchedulesList = controller.getWorkScheduleList();

        HttpSession mySession = request.getSession();
        mySession.setAttribute("workScheduleList", workSchedulesList);

        request.getRequestDispatcher("WEB-INF/views/vistaHorarios.jsp").forward(request, response);
    }

    public void getInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");

        if (id != null && id.matches("\\d+")) {
            int workScheduleID = Integer.parseInt(id);

            Horario workSchedule = controller.getWorkScheduleById(workScheduleID);

            if (workSchedule != null) {
                HttpSession mySession = request.getSession();
                mySession.setAttribute("workSchedule", workSchedule);
                request.getRequestDispatcher("WEB-INF/views/vistaHorarioInfo.jsp").forward(request, response);
                return;
            } else {
                response.sendRedirect("work-schedule");
            }
        } else {
            response.sendRedirect("work-schedule");
        }
    }

    public void createWorkSchedule(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String wsName = request.getParameter("WSName");
        String entryTime = request.getParameter("entryTime");
        String exitTime = request.getParameter("exitTime");

        controller.createWorkSchedule(wsName, entryTime, exitTime);

        response.sendRedirect(request.getContextPath() + "/work-schedule");
    }

    public void deleteWorkSchedule(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String workScheduleIdToDelete = request.getParameter("id");

        if (workScheduleIdToDelete != null && !workScheduleIdToDelete.isEmpty()) {

            int workScheduleID = Integer.parseInt(workScheduleIdToDelete);
            controller.destroyWorkSchedule(workScheduleID);

            response.sendRedirect("work-schedule");
        }
    }

    public void editingWorkSchedule(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String workScheduleIdToEdit = request.getParameter("id");

        if (workScheduleIdToEdit != null && !workScheduleIdToEdit.isEmpty()) {
            int workScheduleId = Integer.parseInt(workScheduleIdToEdit);
            Horario workScheduleToEdit = controller.getWorkScheduleById(workScheduleId);

            HttpSession mySession = request.getSession();
            mySession.setAttribute("workScheduleToEdit", workScheduleToEdit);

            request.getRequestDispatcher("WEB-INF/views/edicionHorario.jsp").forward(request, response);
            return;
        } else {
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }

    public void editWorkSchedule(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String wsName = request.getParameter("WSName");
        String entryTime = request.getParameter("entryTime");
        String exitTime = request.getParameter("exitTime");

        HttpSession mySession = request.getSession();
        Horario workScheduleToEdit = (Horario) mySession.getAttribute("workScheduleToEdit");

        controller.editWorkSchedule(workScheduleToEdit, wsName, entryTime, exitTime);

        request.removeAttribute("workScheduleToEdit");
        response.sendRedirect("work-schedule");
    }
}

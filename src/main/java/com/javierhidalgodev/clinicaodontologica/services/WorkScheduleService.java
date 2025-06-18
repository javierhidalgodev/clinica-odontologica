package com.javierhidalgodev.clinicaodontologica.services;

import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Horario;
import com.javierhidalgodev.clinicaodontologica.utils.PathUtils;
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

    public void doAction(String pathInfo, String action, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (pathInfo.equals("/new")) {
            createWorkSchedule(request, response);
        }

        Integer workScheduleID = PathUtils.isPathInfoID(pathInfo);

        if (workScheduleID != null) {
            if (action.equals("edit")) {
                editWorkSchedule(request, response, workScheduleID);
            }

            if (action.equals("delete")) {
                deleteWorkSchedule(request, response);
            }
        }
    }

    public void getAllWorkSchedules(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Horario> workSchedulesList = controller.getWorkScheduleList();

        HttpSession mySession = request.getSession();
        mySession.setAttribute("workScheduleList", workSchedulesList);

        request.getRequestDispatcher("WEB-INF/views/workScheduleView.jsp").forward(request, response);
    }

    public void getInfo(HttpServletRequest request, HttpServletResponse response, int workScheduleID)
            throws ServletException, IOException {
        Horario workSchedule = controller.getWorkScheduleById(workScheduleID);

        if (workSchedule != null) {
            request.setAttribute("workSchedule", workSchedule);

            request.getRequestDispatcher("/WEB-INF/views/workScheduleInfoView.jsp").forward(request, response);
            return;
        }

        response.sendRedirect(request.getContextPath() + "/work-schedule");
        return;
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

    public void editingWorkSchedule(HttpServletRequest request, HttpServletResponse response, Integer workScheduleID)
            throws ServletException, IOException {
        Horario workScheduleToEdit = controller.getWorkScheduleById(workScheduleID);

        HttpSession mySession = request.getSession();
        mySession.setAttribute("workScheduleToEdit", workScheduleToEdit);

        request.getRequestDispatcher("/WEB-INF/views/workScheduleEditView.jsp").forward(request, response);
        return;
    }

    public void editWorkSchedule(HttpServletRequest request, HttpServletResponse response, Integer workScheduleID)
            throws ServletException, IOException {
        Horario workScheduleToEdit = controller.getWorkScheduleById(workScheduleID);

        String wsName = request.getParameter("WSName");
        String entryTime = request.getParameter("entryTime");
        String exitTime = request.getParameter("exitTime");

        controller.editWorkSchedule(workScheduleToEdit, wsName, entryTime, exitTime);

        request.removeAttribute("workScheduleToEdit");
        response.sendRedirect(request.getContextPath() + "/work-schedule");
    }
}

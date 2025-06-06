package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.services.WorkScheduleService;
import com.javierhidalgodev.clinicaodontologica.utils.PathUtils;
import java.io.IOException;
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
@WebServlet(name = "SvWorkSchedule", urlPatterns = {
    "/work-schedule",
    "/work-schedule/*"})
public class SvWorkSchedule extends HttpServlet {

    WorkScheduleService workScheduleService = new WorkScheduleService();

    private boolean doBefore(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession mySession = request.getSession(false);
        UserDTO userSession = (UserDTO) mySession.getAttribute("userSession");
        
        if(userSession.getRole().equals("user")) {
            response.sendRedirect(request.getContextPath() + "/index");
            return false;
        }
        
        return true;
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        if(!doBefore(request, response)) return;
        
        String pathInfo = request.getPathInfo();

        if (pathInfo == null) {
            workScheduleService.getAllWorkSchedules(request, response);
            return;
        }

        if (PathUtils.isPathInfoID(pathInfo) != null) {
            workScheduleService.getInfo(request, response, PathUtils.isPathInfoID(pathInfo));
            return;
        }

        if (PathUtils.isPathInfoNew(pathInfo)) {
            request.getRequestDispatcher("/WEB-INF/views/workScheduleRegisterView.jsp").forward(request, response);
            return;
        } else {
            response.sendRedirect(request.getContextPath() + "/work-schedule");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pathInfo = request.getPathInfo();

        if (pathInfo != null) {
            Integer workScheduleID = PathUtils.isPathInfoID(pathInfo);
            String action = request.getParameter("action");

            if (workScheduleID != null && "getInfo".equals(action)) {
                workScheduleService.getInfo(request, response, workScheduleID);
            } else {
                if ("create".equals(action)) {
                    workScheduleService.createWorkSchedule(request, response);
                } else if ("delete".equals(action)) {
                    workScheduleService.deleteWorkSchedule(request, response);
                } else if ("editing".equals(action)) {
                    workScheduleService.editingWorkSchedule(request, response, workScheduleID);
                } else if ("edit".equals(action)) {
                    workScheduleService.editWorkSchedule(request, response, workScheduleID);
                } else {
                    response.sendRedirect(request.getContextPath() + "/index");
                }
            }
        }
    }
}

package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import com.javierhidalgodev.clinicaodontologica.services.WorkScheduleService;
import com.javierhidalgodev.clinicaodontologica.utils.PathUtils;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvWorkSchedule", urlPatterns = {
    "/work-schedule",
    "/work-schedule/*"})
public class SvWorkSchedule extends HttpServlet {

    WorkScheduleService workScheduleService = new WorkScheduleService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pathInfo = request.getPathInfo();

        if (pathInfo == null) {
            workScheduleService.getAllWorkSchedules(request, response);
            return;
        }

        if (PathUtils.isPathInfoID(pathInfo) != null) {
            String queryParams = request.getQueryString();
            if (queryParams != null) {
                if (queryParams.equals("editing=true")) {
                    workScheduleService.editingWorkSchedule(request, response, PathUtils.isPathInfoID(pathInfo));
                    return;
                } else {
                    response.sendRedirect(request.getContextPath() + "/work-schedule" + pathInfo);
                    return;
                }
            }

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

        if (pathInfo == null) {
            response.sendRedirect(request.getContextPath() + request.getServletPath());
            return;
        }

        String action = request.getParameter("action");

        if (action != null) {
            workScheduleService.doAction(pathInfo, action, request, response);
            return;
        }

        response.sendRedirect(request.getContextPath() + "/index");
    }
}

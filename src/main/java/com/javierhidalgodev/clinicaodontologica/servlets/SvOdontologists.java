package com.javierhidalgodev.clinicaodontologica.servlets;

import com.javierhidalgodev.clinicaodontologica.services.OdontologistService;
import com.javierhidalgodev.clinicaodontologica.utils.PathUtils;
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
@WebServlet(name = "SvOdontologists", urlPatterns = {
    "/odontologists",
    "/odontologists/*",})
public class SvOdontologists extends HttpServlet {

    OdontologistService odontologistService = new OdontologistService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recuperamos el pathInfo
        String pathInfo = request.getPathInfo();

        // Si no hay nada, vamos a la vista general
        if (pathInfo == null) {
            odontologistService.getAllOdontologists(request, response);
            return;
        }

        // Si es un ID válido procesamos para obtener vista específica
        if (PathUtils.isPathInfoID(pathInfo) != null) {
            odontologistService.getInfo(request, response, PathUtils.isPathInfoID(pathInfo));
            return;
        }

        // Si el patrón es "new" mostramos la vista de creación
        // Si no, redirigimos a la vista general
        if (PathUtils.isPathInfoNew(pathInfo)) {
            odontologistService.loadFormData(request, response);
            return;
        } else {
            response.sendRedirect(request.getContextPath() + "/odontologists");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo != null) {
            Integer odontologistID = PathUtils.isPathInfoID(pathInfo);
            String action = request.getParameter("action");

            if (odontologistID != null && "getInfo".equals(action)) {
//                System.out.println("HAGO UN GET INFO");
                odontologistService.getInfo(request, response, odontologistID);
            } else {
//                System.out.println("O HAGO OTRA COSA DISTINTA DEPENDIENDO DE LA ACCIÓN");
                if ("create".equals(action)) {
//                    System.out.println("CREO UN ODONTO");
                    odontologistService.createOdontologist(request, response);
                } else if ("delete".equals(action)) {
//                    System.out.println("BORRO ODONTO");
                    odontologistService.deleteOdontologist(request, response);
                } else if ("editing".equals(action)) {
//                    System.out.println("EMPIEZO A EDITAR ODONTO");
                    odontologistService.editingOdontologist(request, response);
                } else if ("edit".equals(action)) {
//                    System.out.println("EDITO UN ODONTO");
                    odontologistService.editOdontologist(request, response);
                } else {
//                    System.out.println("NO SÉ QUE HACER, ME VOY A INDEX");
                    response.sendRedirect(request.getContextPath() + "/index");
                }
            }
        }
    }
}

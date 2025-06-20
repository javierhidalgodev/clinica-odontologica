package com.javierhidalgodev.clinicaodontologica.services;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import com.javierhidalgodev.clinicaodontologica.logica.Controller;
import com.javierhidalgodev.clinicaodontologica.logica.Horario;
import com.javierhidalgodev.clinicaodontologica.logica.Odontologo;
import com.javierhidalgodev.clinicaodontologica.logica.Turno;
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
public class OdontologistService {

    Controller controller = Controller.getInstance();

    public void doAction(String pathInfo, String action, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(pathInfo.equals("/new")) {
            createOdontologist(request, response);
        }
        
        Integer odontologistID = PathUtils.isPathInfoID(pathInfo);
        
        if(odontologistID != null) {
            if(action.equals("edit")) {
                editOdontologist(request, response);
            }
            
            if(action.equals("delete")) {
                deleteOdontologist(request, response);
            }
        }
    }
    
    public void getAllOdontologists(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Odontologo> odontologistList = controller.getAllOdontologists();

        request.setAttribute("odontologistList", odontologistList);

        request.getRequestDispatcher("/WEB-INF/views/odontologistsView.jsp").forward(request, response);
        return;
    }

    public void getInfo(HttpServletRequest request, HttpServletResponse response, int odontologistID)
            throws ServletException, IOException {
        Odontologo odontologist = controller.getOdontologistById(odontologistID);

        if (odontologist != null) {
            System.out.println("DEVUELVO EL ODONTÓLOGO");

            request.setAttribute("odontologist", odontologist);

            request.getRequestDispatcher("/WEB-INF/views/odontologistInfoView.jsp").forward(request, response);
            return;
        }

        System.out.println("NO EXISTE ESE ODONTÓLOGO");
        response.sendRedirect(request.getContextPath() + "/odontologists");
        return;
    }

    public void loadFormData(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession mySession = request.getSession(false);

        if (request.getSession().getAttribute("workScheduleList") == null) {
            List<Horario> workScheduleList = controller.getWorkScheduleList();

            mySession.setAttribute("workScheduleList", workScheduleList);
        }

        request.getRequestDispatcher("/WEB-INF/views/odontologistRegisterView.jsp").forward(request, response);
        return;
    }

    public void createOdontologist(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String surname = request.getParameter("surname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String specialization = request.getParameter("specialization");
        String dni = request.getParameter("dni");
        String birthday = request.getParameter("birthday");
        String workSchedule = request.getParameter("workSchedule");

        controller.createOdontologist(firstName, surname, address, phone, birthday, dni, specialization, workSchedule);

        response.sendRedirect(request.getContextPath() + "/odontologists");
    }

    public void editingOdontologist(HttpServletRequest request, HttpServletResponse response, Integer odontologistID)
            throws ServletException, IOException {
        Odontologo odontologistToEdit = controller.getOdontologistById(odontologistID);
        List<UserDTO> userList = controller.getAllFreeUsers();

        HttpSession mySession = request.getSession(false);
        mySession.setAttribute("odontologistToEdit", odontologistToEdit);
        mySession.setAttribute("freeUserList", userList);

        List<Turno> turnos = odontologistToEdit.getWorkShift();

        if (mySession.getAttribute("workScheduleList") == null) {
            List<Horario> workScheduleList = controller.getWorkScheduleList();

            mySession.setAttribute("workScheduleList", workScheduleList);
        }

        request.getRequestDispatcher("/WEB-INF/views/odontologistEditView.jsp").forward(request, response);
        return;
    }

    public void editOdontologist(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String surname = request.getParameter("surname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String birthdate = request.getParameter("birthdate");
        String specialization = request.getParameter("specialization");
        String workSchedule = request.getParameter("wSchedule");
        String user = request.getParameter("user");

        Odontologo odontologistToEdit = (Odontologo) request.getSession().getAttribute("odontologistToEdit");

        controller.editOdontologist(odontologistToEdit, firstName, surname, address, phone, birthdate, specialization, workSchedule, user);
        request.removeAttribute("odontologistToEdit");

        response.sendRedirect(request.getContextPath() + "/odontologists");
    }

    public void deleteOdontologist(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String odontologistIdToDelete = request.getParameter("id");

        if (odontologistIdToDelete != null && !odontologistIdToDelete.isEmpty()) {
            int odontoID = Integer.parseInt(odontologistIdToDelete);

            controller.destroyOdontologist(odontoID);

            response.sendRedirect(request.getContextPath() + "/odontologists");
        }
    }
}

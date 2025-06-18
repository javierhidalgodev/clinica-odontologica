package com.javierhidalgodev.clinicaodontologica.utils;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionUtils {
    
    public static UserDTO getUserSession (HttpServletRequest request) throws ServletException, IOException {
        HttpSession mySession = request.getSession(false);
        UserDTO userSession = (UserDTO) mySession.getAttribute("userSession");
        
        return userSession;
    }
    
}

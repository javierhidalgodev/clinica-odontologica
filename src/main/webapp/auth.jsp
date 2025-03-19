<%@page import="com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO"%>
<%

    UserDTO userSession = (UserDTO) session.getAttribute("userSession");

    if (userSession == null) {
        System.out.println("ME EJECUTO MAMONES");
        session.invalidate();
        response.sendRedirect("login.jsp");
    } else {
        System.out.println(userSession.getProfessional());
    }

%>

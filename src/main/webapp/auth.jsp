<%@page import="com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO"%>
<%

    HttpSession mySession = request.getSession(false);
    UserDTO user = (UserDTO) mySession.getAttribute("userSession");

    if (user == null) {
        mySession.invalidate();
        response.sendRedirect("login.jsp");
        return;
    }
%>

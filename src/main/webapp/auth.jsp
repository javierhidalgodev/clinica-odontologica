<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession mysession = request.getSession(false);
    String user = (String) mysession.getAttribute("usernameSession");

    if (mysession == null || user == null) {
        response.sendRedirect("login.jsp");
    }
%>

<%@page import="java.util.List"%>
<%
    HttpSession mysession = request.getSession(false);
    String user = (String) mysession.getAttribute("usernameSession");
    
    // No detecta la sesi�n como nula... �por qu�?
    if (mysession.getAttribute("usernameSession") == null) {
        response.sendRedirect("login.jsp");
    }
%>

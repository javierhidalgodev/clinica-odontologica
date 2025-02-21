<%@page import="java.util.List"%>
<%
    HttpSession mysession = request.getSession(false);
    String user = (String) mysession.getAttribute("usernameSession");
    
    // No detecta la sesión como nula... ¿por qué?
    if (mysession.getAttribute("usernameSession") == null) {
        response.sendRedirect("login.jsp");
    }
%>

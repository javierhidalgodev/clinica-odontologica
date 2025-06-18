<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Usuario"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Secretario"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Turno"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@include file="../../layouts/firstPart.jsp" %>

<%
    UserDTO userSession = (UserDTO) request.getSession(false).getAttribute("userSession");
    Usuario user = (Usuario) request.getAttribute("user");
%>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/users">Usuarios</a></li>
        <li class="breadcrumb-item" aria-current="page"><%= user.getUsername() %></li>
    </ol>
</nav>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <div class="d-flex justify-content-between align-items-center">
            <span class="m-0 font-weight-bold text-primary">Información del usuario</span>
            <% if (userSession.getRole().equals("admin")) {%>
            <div id="actions" class="d-flex" style="gap: 8px">
                <a href="${pageContext.request.contextPath}/users/<%= user.getIdUser()%>?editing=true" role="button" class="btn btn-success">
                    <i class="fas fa-solid fa-edit" style="width: 16px"></i>
                </a>
                <form action="${pageContext.request.contextPath}/users/<%= user.getIdUser()%>" method="POST" id="form">
                    <input type="hidden" id="input-id" name="id" value="<%= user.getIdUser()%>" />
                    <input type="hidden" id="input-action" name="action" value="delete" />
                    <button
                        id="action-btn"
                        type="button"
                        class="btn btn-danger"
                        data-action="delete"
                        data-toggle="modal"
                        data-target="#modal">
                        <i class="fas fa-solid fa-trash-alt" style="width: 16px"></i>
                    </button>
                </form>
            </div>
            <% }%>
        </div>
    </div>
    <div class="card-body">
        <p>Nombre de usuario: <%= user.getUsername()%></p>
        <p>Rol: <%= user.getRole()%></p>
        <% if (user.getOdontologist() != null) {%>
        <p>Profesional asignado: <%= user.getOdontologist().getName()%> <%= user.getOdontologist().getSurname()%></p>
        <% } %>
        <% if (user.getSecretary() != null) {%>
        <p>Profesional asignado: <%= user.getSecretary().getName()%> <%= user.getSecretary().getSurname()%></p>
        <% }%>
    </div>
</div>

<%@include file="../../components/modal.jsp" %>

<%@include file="../../layouts/endPart.jsp" %>
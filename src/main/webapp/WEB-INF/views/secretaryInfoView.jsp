<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Secretario"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Turno"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@include file="../../layouts/firstPart.jsp" %>

<%
    UserDTO userSession = (UserDTO) request.getSession(false).getAttribute("userSession");
    Secretario secretary = (Secretario) request.getAttribute("secretary");
%>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/secretaries">Secretarios</a></li>
        <li class="breadcrumb-item" aria-current="page"><%= secretary.getName()%> <%= secretary.getSurname()%></li>
    </ol>
</nav>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <div class="d-flex justify-content-between align-items-center">
            <span class="m-0 font-weight-bold text-primary">Dr. <%= secretary.getName()%> <%= secretary.getSurname()%></span>
            <% if (userSession.getRole().equals("admin")) {%>
            <div id="actions" class="d-flex" style="gap: 8px">
                <a href="${pageContext.request.contextPath}/secretaries/<%= secretary.getId()%>?editing=true" role="button" class="btn btn-success w-fit">
                    <i class="fas fa-solid fa-edit" style="width: 16px"></i>
                </a>
                <form action="${pageContext.request.contextPath}/secretaries/<%= secretary.getId()%>" method="POST" id="form">
                    <input type="hidden" id="input-id" name="id" value="<%= secretary.getId()%>" />
                    <input type="hidden" id="input-action" name="action" value="delete" />
                    <button
                        type="button"
                        id="action-btn"
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
        <p>Dirección: <%= secretary.getAddress()%></p>
        <p>Teléfono: <%= secretary.getPhone()%></p>
        <p>
            <%
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
                String formatDate = simpleDateFormat.format(secretary.getBirthdate());
            %>
            Fecha de nacimiento: <%= formatDate%>
        </p>
        <p>DNI: <%= secretary.getDni()%></p>
        <p>Posición: <%= secretary.getFloor()%></p>
        <% if (secretary.getUser() != null) {%>
        <p>Usario: <%= secretary.getUser().getUsername()%></p>
        <% }%>
    </div>
</div>

<%@include file="../../components/modal.jsp" %>

<%@include file="../../layouts/endPart.jsp" %>
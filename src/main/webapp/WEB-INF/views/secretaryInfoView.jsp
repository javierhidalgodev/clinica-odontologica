<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Secretario"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Turno"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@include file="../../layouts/firstPart.jsp" %>

<% Secretario secretary = (Secretario) request.getSession().getAttribute("secretary");%>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <div class="d-flex justify-content-between align-items-center">
            <span class="m-0 font-weight-bold text-primary">Dr. <%= secretary.getName()%> <%= secretary.getSurname()%></span>
            <div class="d-flex" id="actions">
                <form action="secretaries?id=<%= secretary.getId()%>" method="POST" class="mr-2">
                    <input type="hidden" name="action" value="editing" />
                    <input type="hidden" name="id" value="<%= secretary.getId()%>" />
                    <button type="submit" class="btn btn-success">
                        <i class="fas fa-solid fa-edit"></i>
                    </button>
                </form>
                <form action="secretaries" method="POST" id="form">
                    <input type="hidden" id="input-id" name="id" value="<%= secretary.getId()%>" />
                    <input type="hidden" id="input-action" name="action" value="delete" />
                </form>
                <button
                    type="button"
                    id="action-btn"
                    class="btn btn-danger"
                    data-action="delete"
                    data-toggle="modal"
                    data-target="#modal">
                    <i class="fas fa-solid fa-trash-alt"></i>
                </button>
            </div>
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
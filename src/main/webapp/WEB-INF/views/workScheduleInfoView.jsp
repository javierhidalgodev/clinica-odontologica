<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Horario"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Usuario"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Secretario"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Turno"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@include file="../../layouts/firstPart.jsp" %>

<% Horario workSchedule = (Horario) request.getSession().getAttribute("workSchedule"); %>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <div class="d-flex justify-content-between align-items-center">
            <span class="m-0 font-weight-bold text-primary">Información del horario de trabajo</span>
            <div class="d-flex" id="actions">
                <form action="work-schedule?id=<%= workSchedule.getIdWorkSchedule()%>" method="POST" class="mr-2">
                    <input type="hidden" name="action" value="editing" />
                    <input type="hidden" name="id" value="<%= workSchedule.getIdWorkSchedule()%>" />
                    <button type="submit" class="btn btn-success">
                        <i class="fas fa-solid fa-edit"></i>
                    </button>
                </form>
                <form action="work-schedule" method="POST" id="form">
                    <input type="hidden" id="input-id" name="id" value="<%= workSchedule.getIdWorkSchedule()%>" />
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
        <p>Nombre: <%= workSchedule.getName()%></p>
        <p>Entrada: <%= workSchedule.getEntryTime()%></p>
        <p>Salida: <%= workSchedule.getExitTime()%></p>
    </div>
</div>

<%@include file="../../components/modal.jsp" %>

<%@include file="../../layouts/endPart.jsp" %>
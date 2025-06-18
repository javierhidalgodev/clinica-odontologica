<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Paciente"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@include file="../../layouts/firstPart.jsp" %>

<%   
    String appDate = (String) request.getSession().getAttribute("appointmentDate");
    String appHour = (String) request.getSession().getAttribute("appointmentHour");
    Odontologo professional = (Odontologo) request.getSession().getAttribute("professional");
    Paciente patient = (Paciente) request.getSession().getAttribute("appointmentPatient");
%>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb justify-content-between">
        <li class="breadcrumb-item no-divider">
            <span class="badge badge-pill badge-dark">1</span>
            <a class="text-muted" href="${pageContext.request.contextPath}/appointments/new/patient">Paciente y fecha</a>
        </li>
        <li class="breadcrumb-item no-divider">
            <span class="badge badge-pill badge-dark">2</span>
            <a class="text-muted" href="${pageContext.request.contextPath}/appointments/new/professional">Profesional</a>
        </li>
        <li class="breadcrumb-item no-divider">
            <span class="badge badge-pill badge-primary">3</span>
            Confirmación de la cita
        </li>
    </ol>
</nav>

<div class="card o-hidden border-0 shadow-lg">
    <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div>
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4 text-left">Confirmación de su cita</h1>
                </div>
                <p>Paciente: <%= patient.getName()%> <%= patient.getSurname()%></p>
                <p>Fecha: <%= appDate%></p>
                <p>Hora: <%= appHour%></p>
                <p>Profesional: Dr. <%= professional.getName()%> <%= professional.getSurname()%></p>
                <p>Especialidad: <%= professional.getSpecialization()%></p>
                <form action="${pageContext.request.contextPath}/appointments/new/ok" method="POST" id="form">
                    <input type="hidden" id="appointmentDate" name="appointmentDate" value="<%= appDate%>">
                    <input type="hidden" id="appointmentHour" name="appointmentHour" value="<%= appHour%>">
                    <input type="hidden" id="professional" name="professional" value="<%= professional.getId()%>">
                    <input type="hidden" id="professional" name="patient" value="<%= patient.getId()%>">
                    <input type="hidden" name="step" value="3" />
                    <button id="submitBtn" type="submit" class="btn btn-success btn-user btn-block btn-">
                        Confirmar
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="../../layouts/endPart.jsp" %>

<script src="js/validations.js"></script>

<style>
    .error-validation {
        color: red;
        font-size: .7rem;
    }
</style>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Paciente"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@include file="layouts/firstPart.jsp" %>

<%

    String appDate = (String) session.getAttribute("appointmentDate");
    String appHour = (String) session.getAttribute("appointmentHour");
    Odontologo professional = (Odontologo) session.getAttribute("professional");
    Paciente patient = (Paciente) session.getAttribute("appointmentPatient");

%>

<div class="container">
    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div>
                <div class="p-5">
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4 text-left">Confirmación de su cita</h1>
                    </div>
                    <p>Paciente: <%= patient.getName() %> <%= patient.getSurname() %></p>
                    <p>Date: <%= appDate%></p>
                    <p>Hour: <%= appHour%></p>
                    <p>Professional: Dr. <%= professional.getName()%> <%= professional.getSurname()%></p>
                    <p>Especialidad: <%= professional.getSpecialization()%></p>
                    <form action="SvAppointmentConfirmation" method="POST" id="form">
                        <input type="hidden" id="appointmentDate" name="appointmentDate" value="<%= appDate %>">
                        <input type="hidden" id="appointmentHour" name="appointmentHour" value="<%= appHour %>">
                        <input type="hidden" id="professional" name="professional" value="<%= professional.getId() %>">
                        <input type="hidden" id="professional" name="patient" value="<%= patient.getId() %>">
                        <button id="submitBtn" type="submit" class="btn btn-success btn-user btn-block">
                            Confirm
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="layouts/endPart.jsp" %>

<script src="js/validations.js"></script>

<style>
    .error-validation {
        color: red;
        font-size: .7rem;
    }
</style>
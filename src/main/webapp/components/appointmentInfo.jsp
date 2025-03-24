<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Responsable"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Paciente"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Turno"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@page import="java.util.List"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Usuario"%>
<%@page import="javax.swing.table.DefaultTableModel"%>

<%
    Turno appointmentInfo = (Turno) request.getAttribute("appointmentInfo");
%>

<% if (appointmentInfo != null) {

        Paciente patient = appointmentInfo.getPatient();
        Odontologo odontologist = appointmentInfo.getOdontologist();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");

%>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <div class="d-flex justify-content-between align-items-center">
            <span class="m-0 font-weight-bold text-primary">Pacient Info</span>
        </div>
    </div>
    <div class="card-body">
        <p>Nombre y apellidos: <%= patient.getName()%> <%= patient.getSurname()%></p>
        <%
            String patientBirthdate = simpleDateFormat.format(patient.getBirthdate());
        %>
        <p>Fecha nacimiento: <%= patientBirthdate%></p>
        <p>Seguridad Social: <%= patient.getPrepaidHealth() ? "Sí" : "No"%></p>
        <p>Grupo Sangíneo: <%= patient.getBloodType()%></p>
        <p>Teléfono: <%= patient.getPhone()%></p>
        <p>Dirección: <%= patient.getAddress()%></p>
        <hr>
        <% if (patient.getGuardian() != null) {
            Responsable guardian = patient.getGuardian();
        %>
        <h6 class="text-primary font-weight-bold">Información del responsable</h6>
        <p>Nombre y apellidos: <%= guardian.getName()%> <%= guardian.getSurname()%></p>
        <%
            String guardianBirthdate = simpleDateFormat.format(guardian.getBirthdate());
        %>
        <p>Fecha nacimiento: <%= guardianBirthdate %></p>
        <p>Seguridad Social: <%= guardian.getRelationship() %></p>
        <p>Teléfono: <%= guardian.getPhone()%></p>
        <p>Dirección: <%= guardian.getAddress()%></p>
        <% } %>
    </div>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <div class="d-flex justify-content-between align-items-center">
            <span class="m-0 font-weight-bold text-primary">Appointment info</span>
        </div>
    </div>
    <div class="card-body">
        <%
            String appointmentDate = simpleDateFormat.format(appointmentInfo.getAppointment());
        %>
        <p>Día: <%= appointmentDate%></p>
        <p>Hora: <%= appointmentInfo.getHour()%></p>
    </div>
</div>

<div class="card shadow mb-4">
    <!-- Card Header - Accordion -->
    <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse"
       role="button" aria-expanded="true" aria-controls="collapseCardExample">
        <div class="d-flex">
            <h6 class="m-0 font-weight-bold text-primary">Professional Info</h6>
        </div>
    </a>

    <!-- Card Content - Collapse -->
    <div class="collapse hide" id="collapseCardExample">
        <div class="card-body">
            <p>Nombre y apellidos: Dr. <%= odontologist.getName()%> <%= odontologist.getSurname()%></p>
            <p>Especialidad: <%= odontologist.getSpecialization()%></p>
            <p>Teléfono: <%= odontologist.getPhone()%></p>
        </div>
    </div>
</div>

<% } else { %>
<p>No data available. Something went wrong. Sorry.</p>
<% }%>

<script>
    deleteForms = document.querySelectorAll("[data-form-action=delete]");

    function confirmDelete(ev) {
        ev.preventDefault();

        confirmation = confirm("¿Seguro que desea eliminar el registro? Esta operación es irreversible");

        if (confirmation) {
            ev.target.submit();
        }
    }

    deleteForms.forEach(f => f.addEventListener("submit", confirmDelete))

</script>
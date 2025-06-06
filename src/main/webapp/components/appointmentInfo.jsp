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

<div class="row">
    <div class="col-xl-8 col-l-7">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="d-flex justify-content-between align-items-center">
                    <span class="m-0 font-weight-bold text-primary">Paciente</span>
                    <form action="${pageContext.request.contextPath}/patients/<%= patient.getId() %>" method="POST">
                        <input type="hidden" name="id" value="<%= patient.getId()%>" />
                        <input type="hidden" name="action" value="getInfo" />
                        <button type="submit" class="btn btn-sm btn-primary btn-user">Detalles</button>
                    </form>
                </div>
            </div>
            <div class="card-body">
                <p>Nombre completo: <%= patient.getName()%> <%= patient.getSurname()%></p>
                <%
                    String patientBirthdate = simpleDateFormat.format(patient.getBirthdate());
                %>
                <p>Fecha de nacimiento: <%= patientBirthdate%></p>
                <p>Seguro médico: <%= patient.getPrepaidHealth() ? "Sí" : "No"%></p>
                <p>Grupo sanguíneo: <%= patient.getBloodType()%></p>
                <p>Teléfono: <%= patient.getPhone()%></p>
                <p>Dirección: <%= patient.getAddress()%></p>
            </div>
        </div>    
    </div>
    <div class="col-xl-4 col-l-5">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="d-flex justify-content-between align-items-center">
                    <span class="m-0 font-weight-bold text-primary">Datos de la cita</span>
                </div>
            </div>
            <div class="card-body">
                <%
                    String appointmentDate = simpleDateFormat.format(appointmentInfo.getAppointment());
                %>
                <p>Fecha: <%= appointmentDate%></p>
                <p>Hora: <%= appointmentInfo.getHour()%></p>
            </div>
        </div>
    </div>
</div>

<% if (patient.getGuardian() != null) {
        Responsable guardian = patient.getGuardian();
%>
<div class="card shadow mb-4">
    <!-- Card Header - Accordion -->
    <a href="#collapseCardGuardian" class="d-block card-header py-3" data-toggle="collapse"
       role="button" aria-expanded="true" aria-controls="collapseCardGuardian">
        <div class="d-flex justify-content-between align-items-center">
            <span class="m-0 font-weight-bold text-primary">Responsable</span>
        </div>
    </a>

    <!-- Card Content - Collapse -->
    <div class="collapse hide" id="collapseCardGuardian">
        <div class="card-body">
            <p>Nombre completo: <%= guardian.getName()%> <%= guardian.getSurname()%></p>
            <%
                String guardianBirthdate = simpleDateFormat.format(guardian.getBirthdate());
            %>
            <p>Fecha de nacimiento: <%= guardianBirthdate%></p>
            <p>Relación: <%= guardian.getRelationship()%></p>
            <p>Teléfono: <%= guardian.getPhone()%></p>
            <p>Dirección: <%= guardian.getAddress()%></p>
        </div>
    </div>
</div>

<% }%>

<div class="card shadow mb-4">
    <!-- Card Header - Accordion -->
    <a href="#collapseCardProfessional" class="d-block card-header py-3" data-toggle="collapse"
       role="button" aria-expanded="true" aria-controls="collapseCardProfessional">
        <div class="d-flex justify-content-between align-items-center">
            <span class="m-0 font-weight-bold text-primary">Profesional</span>
        </div>
    </a>

    <!-- Card Content - Collapse -->
    <div class="collapse hide" id="collapseCardProfessional">
        <div class="card-body">
            <p>Nombre completo: Dr. <%= odontologist.getName()%> <%= odontologist.getSurname()%></p>
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
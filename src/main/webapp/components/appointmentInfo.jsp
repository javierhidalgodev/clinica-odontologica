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
                    <span class="m-0 font-weight-bold text-primary">Pacient</span>
                    <form action="SvPatientInfo" method="GET">
                        <input type="hidden" name="id" value="<%= patient.getId()%>" />
                        <button type="submit" class="btn btn-sm btn-primary">Details</button>
                    </form>
                </div>
            </div>
            <div class="card-body">
                <p>Full Name: <%= patient.getName()%> <%= patient.getSurname()%></p>
                <%
                    String patientBirthdate = simpleDateFormat.format(patient.getBirthdate());
                %>
                <p>Birthdate: <%= patientBirthdate%></p>
                <p>Prepaid Health: <%= patient.getPrepaidHealth() ? "Sí" : "No"%></p>
                <p>Blood Type: <%= patient.getBloodType()%></p>
                <p>Phone: <%= patient.getPhone()%></p>
                <p>Address <%= patient.getAddress()%></p>
            </div>
        </div>    
    </div>
    <div class="col-xl-4 col-l-5">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="d-flex justify-content-between align-items-center">
                    <span class="m-0 font-weight-bold text-primary">Appointment</span>
                </div>
            </div>
            <div class="card-body">
                <%
                    String appointmentDate = simpleDateFormat.format(appointmentInfo.getAppointment());
                %>
                <p>Date: <%= appointmentDate%></p>
                <p>Hour: <%= appointmentInfo.getHour()%></p>
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
            <span class="m-0 font-weight-bold text-primary">Guardian</span>
        </div>
    </a>

    <!-- Card Content - Collapse -->
    <div class="collapse hide" id="collapseCardGuardian">
        <div class="card-body">
            <p>Full Name: <%= guardian.getName()%> <%= guardian.getSurname()%></p>
            <%
                String guardianBirthdate = simpleDateFormat.format(guardian.getBirthdate());
            %>
            <p>Birthdate: <%= guardianBirthdate%></p>
            <p>Relationship: <%= guardian.getRelationship()%></p>
            <p>Phone: <%= guardian.getPhone()%></p>
            <p>Address <%= guardian.getAddress()%></p>
        </div>
    </div>
</div>

<% }%>

<div class="card shadow mb-4">
    <!-- Card Header - Accordion -->
    <a href="#collapseCardProfessional" class="d-block card-header py-3" data-toggle="collapse"
       role="button" aria-expanded="true" aria-controls="collapseCardProfessional">
        <div class="d-flex justify-content-between align-items-center">
            <span class="m-0 font-weight-bold text-primary">Professional</span>
        </div>
    </a>

    <!-- Card Content - Collapse -->
    <div class="collapse hide" id="collapseCardProfessional">
        <div class="card-body">
            <p>Full Name: Dr. <%= odontologist.getName()%> <%= odontologist.getSurname()%></p>
            <p>Speciality: <%= odontologist.getSpecialization()%></p>
            <p>Phone: <%= odontologist.getPhone()%></p>
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
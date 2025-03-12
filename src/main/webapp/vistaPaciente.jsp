<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Relationship"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Responsable"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Paciente"%>
<%@include file="layouts/firstPart.jsp" %>
<%
    Paciente patient = (Paciente) session.getAttribute("patientDetails");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String patientBirth = sdf.format(patient.getBirthdate());

    Responsable guardian = patient.getGuardian();
%>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <div class="d-flex justify-content-between align-items-center">
            <span class="m-0 font-weight-bold text-primary">Pacient Info</span>
            <div class="d-flex" id="actions">

                <a href="edicionPaciente.jsp" class="btn btn-success mr-2">Editar</a>

                <form action="SvPatientDelete" method="POST" data-form-action="delete">
                    <input type="hidden" id="patientIdToDelete" name="idToDelete" value="<%= patient.getId()%>">
                    <button type="submit" class="btn btn-danger">Eliminar</button>
                </form>
            </div>
        </div>
    </div>
    <div class="card-body">
        <p>Name: <%= patient.getName()%></p>
        <p>Surname: <%= patient.getSurname()%></p>
        <p>Address: <%= patient.getAddress()%></p>
        <p>Phone: <%= patient.getPhone()%></p>
        <p>Birthdate: <%= patientBirth%></p>
        <p>DNI: <%= patient.getDni()%></p>
        <p>Prepaid Health: <%= patient.getPrepaidHealth() ? "Sí" : "No"%></p>
        <p>Blood type: <%= patient.getBloodType()%></p>
    </div>
</div>

<% if (patient.getGuardian() != null) {%>
<div class="card shadow mb-4">
    <!-- Card Header - Accordion -->
    <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse"
       role="button" aria-expanded="true" aria-controls="collapseCardExample">
        <div class="d-flex">
            <h6 class="m-0 font-weight-bold text-primary">Guardian Info</h6>
        </div>
    </a>

    <!-- Card Content - Collapse -->
    <div class="collapse show" id="collapseCardExample">
        <div class="card-body">
            <div class="d-flex mb-3" id="guardianActions">
                <a href="edicionResponsable.jsp" class="btn btn-success mr-2">Editar</a>

                <%
                    LocalDate birth = LocalDate.parse(patientBirth);
                    LocalDate today = LocalDate.now();
                    Period period = Period.between(birth, today);

                    if (period.getYears() > 18) {
                %>
                        <form action = "SvGuardianDelete" method = "POST" data-form-action="delete">
                            <input type="hidden" id="guardianIdToDelete" name="guardianIdToDelete" value="<%= patient.getGuardian().getId()%>">
                            <button type="submit" class="btn btn-danger">Eliminar</button>
                        </form>
                <% } %>
            </div>
            <p>Name: <%= guardian.getName()%></p>
            <p>Surname: <%= guardian.getSurname()%></p>
            <p>Address: <%= guardian.getAddress()%></p>
            <p>Phone: <%= guardian.getPhone()%></p>
            <p>Birthdate: <%= sdf.format(guardian.getBirthdate())%></p>
            <p>DNI: <%= guardian.getDni()%></p>
            <p>Relationship: <%= Relationship.fromKey(guardian.getRelationship())%></p>
        </div>
    </div>
</div>
<% }%>

<%@include file="layouts/endPart.jsp" %>

<script>
    deleteForms = document.querySelectorAll("[data-form-action=delete]");

    function confirmDelete(ev) {
        ev.preventDefault();

        confirmation = confirm("¿Estás seguro de que deseas eliminar el registro? Esta operación es irreversible.");

        if (confirmation) {
            ev.target.submit();
        }
    }

    deleteForms.forEach(dF => {
        dF.addEventListener("submit", confirmDelete);
    })
</script>
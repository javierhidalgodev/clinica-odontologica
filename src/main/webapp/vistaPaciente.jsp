<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Relationship"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Responsable"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

                <form action="SvPatientDelete" method="POST" id="deleteForm">
                    <input type="hidden" id="patientIdToDelete" name="idToDelete" value="<%= patient.getId() %>">
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
        <div>
            <h6 class="m-0 font-weight-bold text-primary">Guardian Info</h6>
            <div id="actions">
                <button>
            </div>
        </div>
    </a>
    <!-- Card Content - Collapse -->
    <div class="collapse show" id="collapseCardExample">
        <div class="card-body">
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
    deleteForm = document.getElementById("deleteForm");
    
    function confirmDelete(ev) {
        ev.preventDefault();
        
        confirmation = confirm("¿Estás seguro de que deseas eliminar el registro? Esta operación es irreversible.");
        
        if(confirmation) {
            deleteForm.submit();
        }
    }
    
    deleteForm.addEventListener("submit", confirmDelete);
</script>
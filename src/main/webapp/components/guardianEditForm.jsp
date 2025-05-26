<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Responsable"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Paciente"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Relationship"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.BloodType"%>
<%@page import="java.util.List"%>

<%

    Paciente patient = (Paciente) session.getAttribute("patientDetails");
    Responsable guardian = patient.getGuardian();

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String birth = sdf.format(guardian.getBirthdate());

%>

<form action="guardians" method="POST" id="form">
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="firstName">Nombre</label>
            <input type="text" class="form-control form-control-user" id="firstName" name="firstName" placeholder="First Name" value="<%= guardian.getName()%>" data-validations="required|minLength:3|maxLength:20">
            <span class="error-validation"></span>                
        </div>
        <div class="col-md-6">
            <label for="surname">Apellidos</label>
            <input type="text" class="form-control form-control-user" id="surname" name="surname" placeholder="Surname" value="<%= guardian.getSurname()%>" data-validations="required|minLength:3|maxLength:50">
            <span class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="address">Dirección</label>
            <input type="text" class="form-control form-control-user" id="address" name="address" placeholder="Address" value="<%= guardian.getAddress()%>" data-validations="required|minLength:5|maxLength:50">
            <span class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="phone">Teléfono</label>
            <input type="tel" class="form-control form-control-user" id="phone" name="phone" placeholder="Phone"  value="<%= guardian.getPhone()%>" data-validations="required|phone">
            <span class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="birthdate">Fecha de nacimiento</label>
            <input type="date" class="form-control form-control-user" id="birthdate" name="birthdate" value="<%= birth%>" data-validations="required|birthdate">
            <span class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="dni">DNI</label>
            <input type="text" class="form-control form-control-user" id="dni" name="dni" placeholder="DNI"  value="<%= guardian.getDni()%>" data-validations="required|dni" disabled="">
            <span class="error-validation"></span>
        </div>
    </div>
    <div class="form-group">
        <label for="relationship">Relación</label>
        <select class="form-control form-control-user" id="relationship" name="relationship" data-validations="required">
            <option disabled="" selected="true" value="">Seleccione una opción</option>
            <%                    for (Relationship relationship : Relationship.values()) {
            %> <option value="<%= relationship.getRelationship()%>" <%= guardian.getRelationship().equals(relationship.getRelationship()) ? "selected" : ""%> ><%= relationship.getRelationshipDescription()%></option> <%
                }
            %>
        </select>
        <span class="error-validation"></span>
    </div>
    <input type="hidden" name="action" value="edit" />
    <button id="submitBtn" type="submit" class="btn btn-success btn-user btn-block">
        Editar
    </button>
</form>

<script src="js/validations.js"></script>

<style>
    .error-validation {
        color: red;
        font-size: .7rem;
    }
</style>
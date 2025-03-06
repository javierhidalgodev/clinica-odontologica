<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Secretario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Secretario secretaryToEdit = (Secretario) session.getAttribute("secretaryToEdit");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String birth = sdf.format(secretaryToEdit.getBirthdate());
%>

<form id="form" class="user" action="SvSecretariesEdit" method="POST">
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <input type="text" class="form-control form-control-user" id="firstName" name="firstName" placeholder="First Name" value="<%= secretaryToEdit.getName()%>" data-validations="required|minLength:2|maxLength:30">
            <span id="errorFirstName" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <input type="text" class="form-control form-control-user" id="surname" name="surname" placeholder="Surname" value="<%= secretaryToEdit.getSurname()%>" data-validations="required|minLength:3|maxLength:50">
            <span id="errorSurname" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <input type="text" class="form-control form-control-user" id="address" name="address" placeholder="Address" value="<%= secretaryToEdit.getAddress()%>" data-validations="required|minLength:5|maxLength:50">
            <span id="errorAddress" class="error-validation"></span>
        </div>
        <div class="col-md-6 mb-3 mb-md-0">
            <input type="tel" class="form-control form-control-user" id="phone" name="phone" placeholder="Phone" value="<%= secretaryToEdit.getPhone()%>" data-validations="required|phone">
            <span id="errorPhone" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6">
            <input type="date" class="form-control form-control-user" id="birthdate" name="birthday" value="<%= birth%>" data-validations="required|birthdate">
            <span id="errorBirthdate" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <input type="text" class="form-control form-control-user" id="dni" name="dni" placeholder="DNI" value="<%= secretaryToEdit.getDni() %>" disabled >
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <input type="text" class="form-control form-control-user" id="examplefloor" name="floor" placeholder="Position" value="<%= secretaryToEdit.getFloor()%>">
        </div>
    </div>
    <button id="submitBtn" type="submit" class="btn btn-success btn-user btn-block font-weight-bold">
        Edit
    </button>
</form>

<script src="js/validations.js"></script>

<style>
    .error-validation {
        color: red;
        font-size: .7rem;
    }
</style>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Horario"%>
<%@page import="java.util.List"%>

<%
    List<Horario> workSchedulesList = (List<Horario>) session.getAttribute("workScheduleList");
%>

<form class="user" action="odontologists" method="POST" id="form" >
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="firstName">Name</label>
            <input type="text" class="form-control form-control-user" id="firstName" name="firstName" placeholder="First Name" data-validations="required|minLength:2|maxLength:30">
            <span id="errorFirstName" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="surname">Surname</label>
            <input type="text" class="form-control form-control-user" id="surname" name="surname" placeholder="Surname" data-validations="required|minLength:3|maxLength:50">
            <span id="errorSurname" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="address">Address</label>
            <input type="text" class="form-control form-control-user" id="address" name="address" placeholder="Address" data-validations="required|minLength:5|maxLength:50">
            <span id="errorAddress" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="phone">Phone</label>
            <input type="tel" class="form-control form-control-user" id="phone" name="phone" placeholder="Phone" data-validations="required|phone">
            <span id="errorPhone" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="birthdate">Birthdate</label>
            <input type="date" class="form-control form-control-user" id="birthdate" name="birthday" data-validations="required|birthdate">
            <span id="errorBirthdate" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="dni">DNI</label>
            <input type="text" class="form-control form-control-user" id="dni" name="dni" placeholder="DNI" data-validations="required|dni">
            <span id="errorDNI" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="specialization">Specialization</label>
            <input type="text" class="form-control form-control-user" id="specialization" name="specialization" placeholder="Specialization">
            <span id="errorSpecialization" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="workSchedule">Work Schedule</label>
            <select class="form-control form-control-user" id="workSchedule" name="workSchedule" data-validations="required">
                <option selected value="">Select one</option>
                <% if (workSchedulesList != null) {
                        for (Horario wS : workSchedulesList) {%>
                <option value="<%= wS.getName()%>"><%= wS.getName() + " / " + wS.getEntryTime()%> -  <%= wS.getExitTime()%></option>                              <% }
                } else { %>
                <option value="" disabled="">No options available</option>                              
                <% }%>
            </select>
            <span id="errorWorkSchedule" class="error-validation"></span>
        </div>
    </div>
    <input type="hidden" name="operation" value="create" />
    <button id="submitBtn" type="submit" class="btn btn-success btn-user btn-block">
        Create
    </button>
</form>

<script src="js/validations.js"></script>

<style>
    .error-validation {
        color: red;
        font-size: .7rem;
    }
</style>
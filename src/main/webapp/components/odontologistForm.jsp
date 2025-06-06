<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Horario"%>
<%@page import="java.util.List"%>

<%
    List<Horario> workSchedulesList = (List<Horario>) session.getAttribute("workScheduleList");
%>

<form action="${pageContext.request.contextPath}/odontologists/new" method="POST" id="form" >
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="firstName">Nombre</label>
            <input type="text" class="form-control form-control-user" id="firstName" name="firstName" placeholder="" data-validations="required|minLength:2|maxLength:30">
            <span id="errorFirstName" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="surname">Apellidos</label>
            <input type="text" class="form-control form-control-user" id="surname" name="surname" placeholder="" data-validations="required|minLength:3|maxLength:50">
            <span id="errorSurname" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="address">Dirección</label>
            <input type="text" class="form-control form-control-user" id="address" name="address" placeholder="" data-validations="required|minLength:5|maxLength:50">
            <span id="errorAddress" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="phone">Teléfono</label>
            <input type="tel" class="form-control form-control-user" id="phone" name="phone" placeholder="" data-validations="required|phone">
            <span id="errorPhone" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="birthdate">Fecha de nacimiento</label>
            <input type="date" class="form-control form-control-user" id="birthdate" name="birthday" data-validations="required|birthdate">
            <span id="errorBirthdate" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="dni">DNI</label>
            <input type="text" class="form-control form-control-user" id="dni" name="dni" placeholder="" data-validations="required|dni">
            <span id="errorDNI" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="specialization">Especialidad</label>
            <input type="text" class="form-control form-control-user" id="specialization" name="specialization" placeholder="">
            <span id="errorSpecialization" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="workSchedule">Horario de trabajo</label>
            <select class="form-control form-control-user" id="workSchedule" name="workSchedule" data-validations="required">
                <option selected value="">Seleccione uno</option>
                <% if (workSchedulesList != null) {
                        for (Horario wS : workSchedulesList) {%>
                <option value="<%= wS.getName()%>"><%= wS.getName() + " / " + wS.getEntryTime()%> -  <%= wS.getExitTime()%></option>                              <% }
                } else { %>
                <option value="" disabled="">No hay opciones disponibles</option>                              
                <% }%>
            </select>
            <span id="errorWorkSchedule" class="error-validation"></span>
        </div>
    </div>
    <input type="hidden" name="action" value="create" />
    <button id="submitBtn" type="submit" class="btn btn-success btn-user btn-block">
        Create
    </button>
</form>

<script src="${pageContext.request.contextPath}/js/validations.js"></script>
<%@page import="com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Horario"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>

<%
    Odontologo odontologistToEdit = (Odontologo) session.getAttribute("odontologistToEdit");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String birth = sdf.format(odontologistToEdit.getBirthdate());

    List<UserDTO> freeUserList = (List) session.getAttribute("freeUserList");

    List<Horario> workSchedulesList = (List<Horario>) session.getAttribute("workScheduleList");
    String odontologistWorkSchedule = odontologistToEdit.getWorkSchedule() != null ? odontologistToEdit.getWorkSchedule().getName() : "not assigned";
%>

<form action="${pageContext.request.contextPath}/odontologists/<%= odontologistToEdit.getId() %>" method="POST" id="form">
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="firstName">Nombre</label>
            <input type="text" class="form-control form-control-user" id="firstName" name="firstName" value="<%= odontologistToEdit.getName()%>" placeholder="First Name" data-validations="required|minLength:2|maxLength:30">
            <span id="errorFirstName" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="surname">Apellido</label>
            <input type="text" class="form-control form-control-user" id="surname" name="surname" value="<%= odontologistToEdit.getSurname()%>" placeholder="Surname" data-validations="required|minLength:3|maxLength:50">
            <span id="errorSurname" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="address">Dirección</label>
            <input type="text" class="form-control form-control-user" id="address" name="address" value="<%= odontologistToEdit.getAddress()%>" placeholder="Address" data-validations="required|minLength:5|maxLength:50">
            <span id="errorAddress" class="error-validation"></span>
        </div>
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="phone">Teléfono</label>
            <input type="tel" class="form-control form-control-user" id="phone" name="phone" value="<%= odontologistToEdit.getPhone()%>" placeholder="Phone" data-validations="required|phone">
            <span id="errorPhone" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6">
            <label for="birthdate">Fecha de nacimiento</label>
            <input type="date" class="form-control form-control-user" id="birthdate" name="birthdate" value="<%= birth%>" data-validations="required|birthdate">
            <span id="errorBirthdate" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="dni">DNI</label>
            <input type="text" class="form-control form-control-user" id="dni" name="dni" value="<%= odontologistToEdit.getDni()%>" placeholder="DNI" disabled="" >
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6">
            <label for="specialization">Especialidad</label>
            <input type="text" class="form-control form-control-user" id="specialization" name="specialization" value="<%= odontologistToEdit.getSpecialization()%>" placeholder="Specialization">
            <span id="errorSpecialization" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="workSchedule">Turno de trabajo (Actual: <%= odontologistWorkSchedule%>)</label>
            <select class="form-control form-control-user" id="workSchedule" name="wSchedule" data-validations="required">
                <option selected value="">Select one to change</option>
                <%
                    for (Horario wS : workSchedulesList) {
                %> <option value="<%= wS.getIdWorkSchedule()%>" <%= odontologistWorkSchedule.equals(wS.getName()) ? "selected" : ""%> ><%= wS.getName() + " / " + wS.getEntryTime()%> -  <%= wS.getExitTime()%></option> <%
                    }
                %>
            </select>
            <span id="errorWorkSchedule" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group">
        <div>
            <%
                if (odontologistToEdit.getUser() == null) {
            %>
            <label for="user">Usuario</label>
            <select class="form-control form-control-user" id="user" name="user" >

                <% if (freeUserList.size() == 0) { %>
                <option selected value="">No free users available</option>
                <% } else { %>
                <option selected value="">Select one to change</option>
                <%
                    for (UserDTO u : freeUserList) {
                %> <option value="<%= u.getId()%>" ><%= u.getUsername()%></option> <%
                        }
                    }
                %>

            </select>
            <span id="errorWorkSchedule" class="error-validation"></span>
            <% } else {%>
            <p>User assigned: <strong><%= odontologistToEdit.getUser().getUsername()%></strong></p>
            <% }%>
        </div>
    </div>
    <input type="hidden" name="action" value="edit" />
    <button
        type="button"
        id="action-btn"
        class="btn btn-success btn-user btn-block font-weight-bold"
        data-action="edit"
        data-toggle="modal"
        data-target="#modal">
        Editar
    </button>
</form>

<%@include file="modal.jsp" %>

<script src="${pageContext.request.contextPath}/js/validations.js"></script>

<style>
    .error-validation {
        color: red;
        font-size: .7rem;
    }
</style>
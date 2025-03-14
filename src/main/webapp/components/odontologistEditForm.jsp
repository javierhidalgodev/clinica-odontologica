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
    
    List<Horario> workScheduleList = (List<Horario>) session.getAttribute("workScheduleList");
    String odontologistWorkSchedule = odontologistToEdit.getWorkSchedule() != null ? odontologistToEdit.getWorkSchedule().getName() : "not assigned";
%>


<form class="user" action="SvOdontologistsEdit" method="POST" id="form">
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="firstName">Name</label>
            <input type="text" class="form-control form-control-user" id="firstName" name="firstName" value="<%= odontologistToEdit.getName()%>" placeholder="First Name" data-validations="required|minLength:2|maxLength:30">
            <span id="errorFirstName" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="surname">Surname</label>
            <input type="text" class="form-control form-control-user" id="surname" name="surname" value="<%= odontologistToEdit.getSurname()%>" placeholder="Surname" data-validations="required|minLength:3|maxLength:50">
            <span id="errorSurname" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="address">Address</label>
            <input type="text" class="form-control form-control-user" id="address" name="address" value="<%= odontologistToEdit.getAddress()%>" placeholder="Address" data-validations="required|minLength:5|maxLength:50">
            <span id="errorAddress" class="error-validation"></span>
        </div>
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="phone">Phone</label>
            <input type="tel" class="form-control form-control-user" id="phone" name="phone" value="<%= odontologistToEdit.getPhone()%>" placeholder="Phone" data-validations="required|phone">
            <span id="errorPhone" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6">
            <label for="birthdate">Birthdate</label>
            <input type="date" class="form-control form-control-user" id="birthdate" name="birthdate" value="<%= birth%>" data-validations="required|birthdate">
            <span id="errorBirthdate" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="DNI">DNI</label>
            <input type="text" class="form-control form-control-user" id="DNI" name="dni" value="<%= odontologistToEdit.getDni()%>" placeholder="DNI" disabled="" >
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6">
            <label for="specialization">Specialization</label>
            <input type="text" class="form-control form-control-user" id="specialization" name="specialization" value="<%= odontologistToEdit.getSpecialization()%>" placeholder="Specialization">
            <span id="errorSpecialization" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="workSchedule">Work Schedule (Actual: <%= odontologistWorkSchedule%>)</label>
            <select class="form-control form-control-user" id="workSchedule" name="workSchedule" data-validations="required">
                <option selected value="">Select one to change</option>
                <%
                    for (Horario wS : workScheduleList) {
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
                if(odontologistToEdit.getUser() == null) {
            %>
            <label for="user">User</label>
            <select class="form-control form-control-user" id="user" name="user" >
                <option selected value="">Select one to change</option>
                <%
                    for (UserDTO u : freeUserList) {
                %> <option value="<%= u.getId() %>" ><%= u.getUsername() %></option> <%
                    }
                %>
            </select>
            <span id="errorWorkSchedule" class="error-validation"></span>
            <% } else { %>
            <p>User assigned: <strong><%= odontologistToEdit.getUser().getUsername %></strong></p>
            <% } %>
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
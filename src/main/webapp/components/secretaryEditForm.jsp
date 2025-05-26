<%@page import="com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Secretario"%>
<%@page import="java.util.List"%>

<%
    Secretario secretaryToEdit = (Secretario) session.getAttribute("secretaryToEdit");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String birth = sdf.format(secretaryToEdit.getBirthdate());

    List<UserDTO> freeUserList = (List) session.getAttribute("freeUserList");
%>

<form id="form" action="secretaries" method="POST">
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="firstName">Nombre</label>
            <input type="text" class="form-control form-control-user" id="firstName" name="firstName" placeholder="First Name" value="<%= secretaryToEdit.getName()%>" data-validations="required|minLength:2|maxLength:30">
            <span id="errorFirstName" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="surname">Apellido</label>
            <input type="text" class="form-control form-control-user" id="surname" name="surname" placeholder="Surname" value="<%= secretaryToEdit.getSurname()%>" data-validations="required|minLength:3|maxLength:50">
            <span id="errorSurname" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="address">Dirección</label>
            <input type="text" class="form-control form-control-user" id="address" name="address" placeholder="Address" value="<%= secretaryToEdit.getAddress()%>" data-validations="required|minLength:5|maxLength:50">
            <span id="errorAddress" class="error-validation"></span>
        </div>
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="phone">Teléfono</label>
            <input type="tel" class="form-control form-control-user" id="phone" name="phone" placeholder="Phone" value="<%= secretaryToEdit.getPhone()%>" data-validations="required|phone">
            <span id="errorPhone" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6">
            <label for="birthdate">Fecha de nacimiento</label>
            <input type="date" class="form-control form-control-user" id="birthdate" name="birthday" value="<%= birth%>" data-validations="required|birthdate">
            <span id="errorBirthdate" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="dni">DNI</label>
            <input type="text" class="form-control form-control-user" id="dni" name="dni" placeholder="DNI" value="<%= secretaryToEdit.getDni()%>" disabled >
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="floor">Posición</label>
            <input type="text" class="form-control form-control-user" id="floor" name="floor" placeholder="Position" value="<%= secretaryToEdit.getFloor()%>">
        </div>
    </div>
    <div class="form-group">
        <div>
            <% if (secretaryToEdit.getUser() != null && freeUserList != null) {%>
            <p>User assigned: <strong><%= secretaryToEdit.getUser().getUsername()%></strong></p>
            <% } else {%>
            <label for="user">Usuario</label>
            <select class="form-control form-control-user" id="user" name="user" >
                <option selected value="">Selecciona una opción para vincular usuario</option>
                <%
                    for (UserDTO u : freeUserList) {
                %> <option value="<%= u.getId()%>" ><%= u.getUsername()%></option> <%
                    }
                %>
            </select>
            <span id="errorWorkSchedule" class="error-validation"></span>
            <% }%>
        </div>
    </div>
    <input type="hidden" name="action" value="edit" />
    <!--    <button id="submitBtn" type="submit" class="btn btn-success btn-user btn-block font-weight-bold">
            Edit
        </button>-->
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
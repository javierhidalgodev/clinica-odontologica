<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Usuario"%>

<%
    Boolean userExists = (Boolean) request.getAttribute("userExists");
%>

<form action="${pageContext.request.contextPath}/users/new" method="POST" id="form">
    <% if (userExists != null && userExists) { %>
    <div id="errorUserExists" class="alert alert-danger small d-flex justify-content-sm-between align-items-center">
        <span>Ese nombre de usuario ya ha sido utilizado</span>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>

    </div>
    <%
        }
    %>
    <div class="form-group row">
        <div class="col-md-6 mb-3 col-md-0">
            <label for="inputUsername">Nombre de usuario</label>
            <input type="text" class="form-control form-control-user" id="inputUsername" name="username" aria-describedby="usernameHelp" data-validations="required|minLength:5|maxLength:20">
            <span id="errorUsername" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="inputRole">Rol</label>
            <select name="role" class="form-control form-control-user" id="inputRole" data-validations="required|role">
                <option value="">Seleccione una opción</option>
                <option value="admin">Admin</option>
                <option value="user">User</option>
            </select>
            <span id="errorRole" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 col-md-0">
            <label for="inputPassword">Contraseña</label>
            <input type="password" name="password" class="form-control form-control-user" id="inputPassword" data-validations="required|minLength:8|maxLength:20|password">
            <span id="errorPassword" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="inputRepeatPassword">Repita la contraseña</label>
            <input type="password" name="repeatpassword" class="form-control form-control-user" id="inputRepeatPassword" data-validations="required|confirmPassword">
            <span id="errorConfirmPassword" class="error-validation"></span>
        </div>
    </div>
    <input type="hidden" name="action" value="create" />
    <button type="submit" id="submitBtn" class="btn btn-success btn-user btn-block">
        Create
    </button>
</form>

<script src="${pageContext.request.contextPath}/js/validations.js"></script>
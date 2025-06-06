<%@page import="java.util.List"%>

<form action="${pageContext.request.contextPath}/secretaries/new" method="POST" id="form">
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="firstName">Nombre</label>
            <input type="text" class="form-control form-control-user" id="firstName" name="firstName" placeholder="" data-validations="required|minLength:2|maxLength:30">
            <span id="errorFirstName" class="error-validation"></span>

        </div>
        <div class="col-md-6">
            <label for="surname">Apellidos</label>
            <input type="text" class="form-control form-control-user" id="surname" name="surname" placeholder="" data-validations="required|minLength:3|maxLength:30">
            <span id="errorSurname" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="address">Dirección</label>
            <input type="text" class="form-control form-control-user" id="address" name="address" placeholder="" data-validations="required|minLength:5|maxLength:50">
            <span id="errorAddress" class="error-validation"></span>

        </div>
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="phone">Teléfono</label>
            <input type="tel" class="form-control form-control-user" id="phone" name="phone" placeholder="" data-validations="required|phone">
            <span id="errorPhone" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6">
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
            <label for="floor">Puesto</label>
            <input type="text" class="form-control form-control-user" id="floor" name="floor" placeholder="">
        </div>
    </div>
    <input type="hidden" name="action" value="create" />
    <button id="submitBtn" type="submit" class="btn btn-success btn-user btn-block">
        Create
    </button>
</form>

<script src="${pageContext.request.contextPath}/js/validations.js"></script>

<style>
    .error-validation {
        color: red;
        font-size: .7rem;
    }
</style>
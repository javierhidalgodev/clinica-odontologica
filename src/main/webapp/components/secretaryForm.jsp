<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<form class="user" action="SvSecretaries" method="POST" id="form">
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <input type="text" class="form-control form-control-user" id="firstName" name="firstName" placeholder="First Name" >
            <span id="errorFirstName" class="error-validation"></span>

        </div>
        <div class="col-md-6">
            <input type="text" class="form-control form-control-user" id="surname" name="surname" placeholder="Surname" >
            <span id="errorSurname" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <input type="text" class="form-control form-control-user" id="address" name="address" placeholder="Address" >
            <span id="errorAddress" class="error-validation"></span>

        </div>
        <div class="col-md-6 mb-3 mb-md-0">
            <input type="tel" class="form-control form-control-user" id="phone" name="phone" placeholder="Phone" >
            <span id="errorPhone" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6">
            <input type="date" class="form-control form-control-user" id="birthdate" name="birthday" >
            <span id="errorBirthdate" class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <input type="text" class="form-control form-control-user" id="dni" name="dni" placeholder="DNI" >
            <span id="errorDNI" class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <input type="text" class="form-control form-control-user" id="floor" name="floor" placeholder="Position">
        </div>
    </div>
    <button type="submit" class="btn btn-success btn-user btn-block">
        Create
    </button>
</form>

<script>
    function validateForm(e) {
        e.preventDefault();

        document.getElementById("errorFirstName").textContent = "";
        document.getElementById("errorSurname").textContent = "";
        document.getElementById("errorAddress").textContent = "";
        document.getElementById("errorBirthdate").textContent = "";
        document.getElementById("errorPhone").textContent = "";
        document.getElementById("errorDNI").textContent = "";

        isValid = true;

        const firstName = document.getElementById("firstName").value;
        if (firstName.length < 3 || firstName.length > 30) {
            document.getElementById("errorFirstName").textContent = "El nombre debe tener entre 5 y 30 caracteres";
            isValid = false;
        }

        const surname = document.getElementById("surname").value;
        if (surname.length < 3 || surname.length > 30) {
            document.getElementById("errorSurname").textContent = "El apellido debe tener entre 5 y 50 caracteres";
            isValid = false;
        }

        const address = document.getElementById("address").value;
        if (address.length < 3 || address.length > 50) {
            document.getElementById("errorAddress").textContent = "La dirección debe tener entre 5 y 50 caracteres";
            isValid = false;
        }

        const phone = document.getElementById("phone").value;
        const phonePattern = /^[0-9]{9,14}$/;
        if (!phonePattern.test(phone)) {
            document.getElementById("errorPhone").textContent = "Escriba un número entre 9-14 dígitos";
            isValid = false;
        }

        const birthdate = document.getElementById("birthdate").value;
        if (birthdate.length < 1) {
            document.getElementById("errorBirthdate").textContent = "Seleccione una fecha";
            isValid = false;
        }

        const dni = document.getElementById("dni").value;
        const dniPattern = /^[0-9]{8}[a-zA-Z]{1}$/;
        if (!dniPattern.test(dni)) {
            document.getElementById("errorDNI").textContent = "DNI mal formado";
            isValid = false;
        }

        if (isValid) {
            document.getElementById("form").submit();
        }
    }

    document.getElementById("form").addEventListener("submit", validateForm);
</script>

<style>
    .error-validation {
        color: red;
        font-size: .7rem;
    }
</style>
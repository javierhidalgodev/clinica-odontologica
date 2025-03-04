<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Horario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Horario> workScheduleList = (List<Horario>) session.getAttribute("workScheduleList");
%>

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div>
                <div class="p-5">
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4 text-left">Create an Odontologist!</h1>
                    </div>
                    <form class="user" action="SvOdontologists" method="POST" id="form">
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
                                <input type="text" class="form-control form-control-user" id="specialization" name="specialization" placeholder="Specialization">
                                <span id="errorSpecialization" class="error-validation"></span>
                            </div>
                            <div class="col-md-6">
                                <select class="form-control form-control-user" id="workSchedule" name="workSchedule" >
                                    <option selected>Select one</option>
                                    <%
                                        for (Horario wS : workScheduleList) {
                                    %> <option value="<%= wS.getName()%>"><%= wS.getName() + " / " + wS.getEntryTime()%> -  <%= wS.getExitTime()%></option> <%
                                        }
                                    %>
                                    <!--                                    <option value="morning">Mañana</option>
                                                                        <option value="evening">Tarde</option>-->
                                </select>
                                <span id="errorWorkSchedule" class="error-validation"></span>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success btn-user btn-block">
                            Create
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>

<script>
    function validateForm(e) {
        e.preventDefault();

        console.log("hola")
        document.getElementById("errorFirstName").textContent = "";
        document.getElementById("errorSurname").textContent = "";
        document.getElementById("errorAddress").textContent = "";
        document.getElementById("errorBirthdate").textContent = "";
        document.getElementById("errorPhone").textContent = "";
        document.getElementById("errorDNI").textContent = "";
        document.getElementById("errorSpecialization").textContent = "";
        document.getElementById("errorWorkSchedule").textContent = "";

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
        const specialization = document.getElementById("specialization").value;
        const workSchedule = document.getElementById("workSchedule").value;
    }

    document.getElementById("form").addEventListener("submit", validateForm);
</script>

<style>

    .error-validation {
        color: red;
        font-size: .7rem;
    }

</style>
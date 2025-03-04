<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Horario"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Odontologo odontologistToEdit = (Odontologo) session.getAttribute("odontologistToEdit");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String birth = sdf.format(odontologistToEdit.getBirthdate());

    List<Horario> workScheduleList = (List<Horario>) session.getAttribute("workScheduleList");
    String odontologistWorkSchedule = odontologistToEdit.getWorkSchedule() != null ? odontologistToEdit.getWorkSchedule().getName() : "not assigned";
%>

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div>
                <div class="p-5">
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4 text-left">Edit an Odontologist!</h1>
                    </div>
                    <form class="user" action="SvOdontologistsEdit" method="POST" id="form">
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <label for="firstName">Name</label>
                                <input type="text" class="form-control form-control-user" id="firstName" name="firstName" value="<%= odontologistToEdit.getName()%>" placeholder="First Name" >
                                <span id="errorFirstName" class="error-validation"></span>
                            </div>
                            <div class="col-md-6">
                                <label for="surname">Surname</label>
                                <input type="text" class="form-control form-control-user" id="surname" name="surname" value="<%= odontologistToEdit.getSurname()%>" placeholder="Surname" >
                                <span id="errorSurname" class="error-validation"></span>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <label for="address">Address</label>
                                <input type="text" class="form-control form-control-user" id="address" name="address" value="<%= odontologistToEdit.getAddress()%>" placeholder="Address" >
                                <span id="errorAddress" class="error-validation"></span>
                            </div>
                            <div class="col-md-6 mb-3 mb-md-0">
                                <label for="phone">Phone</label>
                                <input type="tel" class="form-control form-control-user" id="phone" name="phone" value="<%= odontologistToEdit.getPhone()%>" placeholder="Phone" >
                                <span id="errorPhone" class="error-validation"></span>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6">
                                <label for="birthdate">Birthdate</label>
                                <input type="date" class="form-control form-control-user" id="birthdate" name="birthdate" value="<%= birth%>" >
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
                                <select class="form-control form-control-user" id="workSchedule" name="workSchedule">
                                    <option selected>Select one to change</option>
                                    <%
                                        for (Horario wS : workScheduleList) {
                                    %> <option value="<%= wS.getIdWorkSchedule()%>"><%= wS.getName() + " / " + wS.getEntryTime()%> -  <%= wS.getExitTime()%></option> <%
                                        }
                                    %>
                                </select>
                                <span id="errorWorkSchedule" class="error-validation"></span>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-success btn-user btn-block font-weight-bold">
                            Edit
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

        document.getElementById("errorFirstName").textContent = "";
        document.getElementById("errorSurname").textContent = "";
        document.getElementById("errorAddress").textContent = "";
        document.getElementById("errorBirthdate").textContent = "";
        document.getElementById("errorPhone").textContent = "";
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

        const workSchedule = document.getElementById("workSchedule").value;
        if (workSchedule != "1" && workSchedule != "2") {
            console.log(workSchedule)
            document.getElementById("errorWorkSchedule").textContent = "Seleccione un horario";
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
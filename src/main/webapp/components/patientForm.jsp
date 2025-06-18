<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Relationship"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.BloodType"%>
<%@page import="java.util.List"%>

<form action="${pageContext.request.contextPath}/patients/new" method="POST" id="form">
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="firstName">Nombre</label>
            <input type="text" class="form-control form-control-user" id="firstName" name="patientFirstName" placeholder="" data-validations="required|minLength:3|maxLength:20">
            <span class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="surname">Apellidos</label>
            <input type="text" class="form-control form-control-user" id="surname" name="patientSurname" placeholder="" data-validations="required|minLength:3|maxLength:50">
            <span class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="address">Dirección</label>
            <input type="text" class="form-control form-control-user" id="address" name="patientAddress" placeholder="" data-validations="required|minLength:3|maxLength:50">
            <span class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="phone">Teléfono</label>
            <input type="tel" class="form-control form-control-user" id="phone" name="patientPhone" placeholder="" data-validations="required|phone">
            <span class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="birthday">Fecha de nacimiento</label>
            <input type="date" class="form-control form-control-user" id="birthday" name="patientBirthdate" onchange="checkDate()" data-validations="required">
            <span class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="dni">DNI</label>
            <input type="text" class="form-control form-control-user" id="dni" name="patientDNI" placeholder=""  data-validations="required|dni">
            <span class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="prepaidHealth">Seguro de salud</label>
            <select class="form-control form-control-user" id="prepaidHealth" name="prepaidHealth" data-validations="required">
                <option disabled="" selected="true" value="">Seleccione uno</option>
                <option value="true">YES</option>
                <option value="false">NO</option>
            </select>
            <span class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="bloodType">Grupo sanguíneo</label>
            <select class="form-control form-control-user" id="bloodType" name="bloodType" data-validations="required">
                <option disabled="" selected="true" value="">Seleccione uno</option>
                <%
                    for (BloodType bloodType : BloodType.values()) {%>
                <option value="<%= bloodType.getBloodType()%>"><%= bloodType.getBloodType()%></option>                   <%
                    }
                %>
            </select>
            <span class="error-validation"></span>
        </div>
    </div>
    <div id="guardianData" style="display: none">
        <hr>
        <div class="text-center">
            <h1 class="h4 text-gray-900 mb-4 text-left">Responsable</h1>
        </div>
        <div class="form-group row">
            <div class="col-md-6 mb-3 mb-md-0">
                <label for="guardianFirstName">Nombre</label>
                <input type="text" class="form-control form-control-user" id="guardianFirstName" name="guardianFirstName" placeholder="John Doe" data-validations="required|minLength:3|maxLength:20">
                <span class="error-validation"></span>                
            </div>
            <div class="col-md-6">
                <label for="guardianSurname">Apellidos</label>
                <input type="text" class="form-control form-control-user" id="guardianSurname" name="guardianSurname" placeholder="Doe" data-validations="required|minLength:3|maxLength:50">
                <span class="error-validation"></span>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-6 mb-3 mb-md-0">
                <label for="guardianAddress">Dirección</label>
                <input type="text" class="form-control form-control-user" id="guardianAddress" name="guardianAddress" placeholder="C/ P/ Av/... número, escalera, rellano, puerta..." data-validations="required|minLength:5|maxLength:50">
                <span class="error-validation"></span>
            </div>
            <div class="col-md-6">
                <label for="guardianPhone">Teléfono</label>
                <input type="tel" class="form-control form-control-user" id="guardianPhone" name="guardianPhone" placeholder="654987321" data-validations="required|phone">
                <span class="error-validation"></span>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-6 mb-3 mb-md-0">
                <label for="guardianBirthdate">Fecha de nacimiento</label>
                <input type="date" class="form-control form-control-user" id="guardianBirthdate" name="guardianBirthdate" onchange="checkDate()" data-validations="required|birthdate">
                <span class="error-validation"></span>
            </div>
            <div class="col-md-6">
                <label for="guardianDNI">DNI</label>
                <input type="text" class="form-control form-control-user" id="guardianDNI" name="guardianDNI" placeholder="" data-validations="required|dni">
                <span class="error-validation"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="relationship">Relación</label>
            <select class="form-control form-control-user" id="exampleRelationship" name="relationship" data-validations="required">
                <option disabled="" selected="true" value="">Seleccione uno</option>
                <%
                    for (Relationship relationship : Relationship.values()) {
                %> <option value="<%= relationship.getRelationship()%>"><%= relationship.getRelationshipDescription()%></option> <%
                    }
                %>
                <!--                                    <option value="morning">Mañana</option>
                                                    <option value="evening">Tarde</option>-->
            </select>
            <span class="error-validation"></span>
        </div>
    </div>
    <input type="hidden" name="action" value="create" />
    <button
        id="submitBtn"
        type="submit"
        role="validations"
        class="btn btn-success btn-user btn-block">
        Create
    </button>
</form>

<script>

    function checkDate() {
        isOk = true;
        dateField = document.getElementById("birthday");
        dateValue = dateField.value;


        if (dateValue) {
            over18 = new Date(dateValue);
            over18.setFullYear(parseInt(over18.getFullYear()) + 18);
            today = new Date();
            guardianDataForm = document.getElementById("guardianData")

            if (over18 < today) {
                guardianDataForm.style.display = "none";
            } else {
                guardianDataForm.style.display = "block";
            }
        }
    }

</script>

<script src="${pageContext.request.contextPath}/js/validations.js"></script>

<style>
    .error-validation {
        color: red;
        font-size: .7rem;
    }
</style>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Paciente"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Relationship"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.BloodType"%>
<%@page import="java.util.List"%>

<%
    Paciente patientToEdit = (Paciente) request.getAttribute("patient");

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String birth = sdf.format(patientToEdit.getBirthdate());

%>

<form
    id="form"
    action="${pageContext.request.contextPath}/patients/<%= patientToEdit.getId() %>"
    method="POST">
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="firstName">Nombre</label>
            <input type="text" class="form-control form-control-user" id="firstName" name="patientFirstName" placeholder="First Name" value="<%= patientToEdit.getName()%>" data-validations="required|minLength:3|maxLength:20">
            <span class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="surname">Apellidos</label>            
            <input type="text" class="form-control form-control-user" id="surname" name="patientSurname" placeholder="Surname" value="<%= patientToEdit.getSurname()%>" data-validations="required|minLength:3|maxLength:50">
            <span class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="address">Dirección</label>
            <input type="text" class="form-control form-control-user" id="address" name="patientAddress" placeholder="Address" value="<%= patientToEdit.getAddress()%>" data-validations="required|minLength:3|maxLength:50">
            <span class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="phone">Teléfono</label>            
            <input type="tel" class="form-control form-control-user" id="phone" name="patientPhone" placeholder="Phone" value="<%= patientToEdit.getPhone()%>" data-validations="required|phone">
            <span class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="birthdate">Fecha de nacimiento</label>            
            <input type="date" class="form-control form-control-user" id="patientBirthdate" name="patientBirthdate" value="<%= birth%>" onchange="checkDate()" data-validations="required">
            <span class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="dni">DNI</label>            
            <input type="text" class="form-control form-control-user" id="dni" name="patientDNI" placeholder="Patient DNI" value="<%= patientToEdit.getDni()%>" data-validations="required|dni" disabled>
            <span class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="prepaidHealth">Seguro médico</label>
            <select class="form-control form-control-user" id="prepaidHealth" name="prepaidHealth" data-validations="required" >
                <option disabled="" selected="true" value="">Seleccione uno</option>
                <option value="true" <%= patientToEdit.getPrepaidHealth() ? "selected" : ""%> >YES</option>
                <option value="false" <%= patientToEdit.getPrepaidHealth() ? "" : "selected"%> >NO</option>
            </select>
            <span class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="bloodType">Grupo sanguíneo</label>            
            <select class="form-control form-control-user" id="bloodType" name="bloodType" data-validations="required">
                <option disabled="" selected="true" value="">Seleccione uno</option>
                <%
                    for (BloodType bloodType : BloodType.values()) {%>
                <option value="<%= bloodType.getBloodType()%>" <%= patientToEdit.getBloodType().equals(bloodType.getBloodType()) ? "selected" : ""%> ><%= bloodType.getBloodType()%></option>                   <%
                    }
                %>
            </select>
            <span class="error-validation"></span>
        </div>
    </div>
    <hr>
    <%
        if (patientToEdit.getGuardian() == null) { %>
    <div id="guardianData" class="d-none">
        <h6>Información del responsable</h6>
        <div class="form-group row">
            <div class="col-md-6 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="guardianFirstName" name="guardianFirstName" placeholder="First Name" data-validations="required|minLength:3|maxLength:20">
                <span class="error-validation"></span>                
            </div>
            <div class="col-md-6">
                <input type="text" class="form-control form-control-user" id="guardianSurname" name="guardianSurname" placeholder="Surname" data-validations="required|minLength:3|maxLength:50">
                <span class="error-validation"></span>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-6 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="guardianInputAddress" name="guardianAddress" placeholder="Address" data-validations="required|minLength:5|maxLength:50">
                <span class="error-validation"></span>
            </div>
            <div class="col-md-6">
                <input type="tel" class="form-control form-control-user" id="guardianPhone" name="guardianPhone" placeholder="Phone" data-validations="required|phone">
                <span class="error-validation"></span>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-6 mb-3 mb-md-0">
                <input type="date" class="form-control form-control-user" id="guardianBirthdate" name="guardianBirthdate" onchange="checkDate()" data-validations="required|birthdate">
                <span class="error-validation"></span>
            </div>
            <div class="col-md-6">
                <input type="text" class="form-control form-control-user" id="guardianDNI" name="guardianDNI" placeholder="DNI" data-validations="required|dni">
                <span class="error-validation"></span>
            </div>
        </div>
        <div class="form-group">
            <select class="form-control form-control-user" id="guardianRelationship" name="relationship" data-validations="required">
                <option disabled="" selected="true" value="">RELATIONSHIP - Select one</option>
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
    <% }%>
    <input type="hidden" name="action" value="edit" />
    <!--    <button id="submitBtn" type="submit" class="btn btn-success btn-user btn-block">
            Edit
        </button>-->
    <button
        type="button"
        role="validations"
        id="action-btn"
        class="btn btn-success btn-user btn-block font-weight-bold"
        data-action="edit">
        Editar
    </button>
</form>

<script>

    function checkDate() {
        const dateField = document.getElementById("patientBirthdate");
        const dateValue = dateField.value;

        if (dateValue) {
            const over18 = new Date(dateValue);
            over18.setFullYear(parseInt(over18.getFullYear()) + 18);
            const today = new Date();
            const guardianDataForm = document.getElementById("guardianData")

            if (guardianDataForm !== null) {
                if (over18 < today) {
                    guardianDataForm.classList.replace("d-block", "d-none");
                } else {
                    guardianDataForm.classList.replace("d-none", "d-block");
                                        
                    const guardianFields = guardianDataForm.querySelectorAll("[data-validations]");
                                        
                    guardianFields.forEach(f => {
                        console.log(f)
                        f.addEventListener("change", validateField);
                    })
                }
            }
        }
    }

</script>

<%@include file="modal.jsp" %>

<script src="${pageContext.request.contextPath}/js/validations.js"></script>

<style>
    .error-validation {
        color: red;
        font-size: .7rem;
    }
</style>
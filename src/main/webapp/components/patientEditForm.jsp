<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Paciente"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Relationship"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.BloodType"%>
<%@page import="java.util.List"%>

<%

    Paciente patient = (Paciente) session.getAttribute("patientDetails");

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String birth = sdf.format(patient.getBirthdate());

%>

<form class="user" action="patients" method="POST" id="form">
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="firstName">Name</label>
            <input type="text" class="form-control form-control-user" id="firstName" name="patientFirstName" placeholder="First Name" value="<%= patient.getName()%>" data-validations="required|minLength:3|maxLength:20">
            <span class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="surname">Surname</label>            
            <input type="text" class="form-control form-control-user" id="surname" name="patientSurname" placeholder="Surname" value="<%= patient.getSurname()%>" data-validations="required|minLength:3|maxLength:50">
            <span class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="address">Address</label>
            <input type="text" class="form-control form-control-user" id="address" name="patientAddress" placeholder="Address" value="<%= patient.getAddress()%>" data-validations="required|minLength:3|maxLength:50">
            <span class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="phone">Phone</label>            
            <input type="tel" class="form-control form-control-user" id="phone" name="patientPhone" placeholder="Phone" value="<%= patient.getPhone()%>" data-validations="required|phone">
            <span class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="birthdate">Birthdate</label>            
            <input type="date" class="form-control form-control-user" id="patientBirthdate" name="patientBirthdate" value="<%= birth%>" onchange="checkDate()" data-validations="required">
            <span class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="dni">DNI</label>            
            <input type="text" class="form-control form-control-user" id="dni" name="patientDNI" placeholder="Patient DNI" value="<%= patient.getDni()%>" data-validations="required|dni" disabled>
            <span class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="prepaidHealth">Prepaid Health</label>
            <select class="form-control form-control-user" id="prepaidHealth" name="prepaidHealth" data-validations="required" >
                <option disabled="" selected="true" value="">PREPAID HEALTH - Select one</option>
                <option value="true" <%= patient.getPrepaidHealth() ? "selected" : ""%> >YES</option>
                <option value="false" <%= patient.getPrepaidHealth() ? "" : "selected"%> >NO</option>
            </select>
            <span class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <label for="bloodType">Blood Type</label>            
            <select class="form-control form-control-user" id="bloodType" name="bloodType" data-validations="required">
                <option disabled="" selected="true" value="">BLOOD TYPE - Select one</option>
                <%
                    for (BloodType bloodType : BloodType.values()) {%>
                <option value="<%= bloodType.getBloodType()%>" <%= patient.getBloodType().equals(bloodType.getBloodType()) ? "selected" : ""%> ><%= bloodType.getBloodType()%></option>                   <%
                    }
                %>
            </select>
            <span class="error-validation"></span>
        </div>
    </div>
    <hr>
    <%
        if (patient.getGuardian() == null) { %>
    <div id="guardianData" class="d-none">
        <h6>Guardian data</h6>
        <div class="form-group row">
            <div class="col-md-6 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="exampleFirstName" name="guardianFirstName" placeholder="First Name" data-validations="required|minLength:3|maxLength:20">
                <span class="error-validation"></span>                
            </div>
            <div class="col-md-6">
                <input type="text" class="form-control form-control-user" id="exampleSurname" name="guardianSurname" placeholder="Surname" data-validations="required|minLength:3|maxLength:50">
                <span class="error-validation"></span>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-6 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="exampleInputAddress" name="guardianAddress" placeholder="Address" data-validations="required|minLength:5|maxLength:50">
                <span class="error-validation"></span>
            </div>
            <div class="col-md-6">
                <input type="tel" class="form-control form-control-user" id="examplePhone" name="guardianPhone" placeholder="Phone" data-validations="required|phone">
                <span class="error-validation"></span>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-6 mb-3 mb-md-0">
                <input type="date" class="form-control form-control-user" id="exampleBirthday" name="guardianBirthdate" onchange="checkDate()" data-validations="required|birthdate">
                <span class="error-validation"></span>
            </div>
            <div class="col-md-6">
                <input type="text" class="form-control form-control-user" id="exampleDNI" name="guardianDNI" placeholder="DNI" data-validations="required|dni">
                <span class="error-validation"></span>
            </div>
        </div>
        <div class="form-group">
            <select class="form-control form-control-user" id="exampleRelationship" name="relationship" data-validations="required">
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
        id="action-btn"
        class="btn btn-success btn-user btn-block font-weight-bold"
        data-action="edit"
        data-toggle="modal"
        data-target="#modal">
        Editar
    </button>
</form>

<script>

    function checkDate() {
        dateField = document.getElementById("patientBirthdate");
        dateValue = dateField.value;


        if (dateValue) {
            over18 = new Date(dateValue);
            over18.setFullYear(parseInt(over18.getFullYear()) + 18);
            today = new Date();
            guardianDataForm = document.getElementById("guardianData")

            if (guardianDataForm !== null) {
                if (over18 < today) {
                    guardianDataForm.classList.replace("d-block", "d-none");
                } else {
                    guardianDataForm.classList.replace("d-none", "d-block");
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
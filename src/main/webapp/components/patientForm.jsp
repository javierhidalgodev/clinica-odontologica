<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Relationship"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.BloodType"%>
<%@page import="java.util.List"%>

<form class="user" action="SvPatients" method="POST" id="form">
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <input type="text" class="form-control form-control-user" id="exampleFirstName" name="patientFirstName" placeholder="First Name" data-validations="required|minLength:3|maxLength:20">
            <span class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <input type="text" class="form-control form-control-user" id="exampleSurname" name="patientSurname" placeholder="Surname" data-validations="required|minLength:3|maxLength:50">
            <span class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <input type="text" class="form-control form-control-user" id="exampleInputAddress" name="patientAddress" placeholder="Address" data-validations="required|minLength:3|maxLength:50">
            <span class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <input type="tel" class="form-control form-control-user" id="examplePhone" name="patientPhone" placeholder="Phone" data-validations="required|phone">
            <span class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <input type="date" class="form-control form-control-user" id="exampleBirthday" name="patientBirthdate" onchange="checkDate()" data-validations="required">
            <span class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <input type="text" class="form-control form-control-user" id="exampleDNI" name="patientDNI" placeholder="Patient DNI"  data-validations="required|dni">
            <span class="error-validation"></span>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <select class="form-control form-control-user" id="examplePrepaidHealth" name="prepaidHealth" data-validations="required">
                <option disabled="" selected="true" value="">PREPAID HEALTH - Select one</option>
                <option value="true">YES</option>
                <option value="false">NO</option>
            </select>
            <span class="error-validation"></span>
        </div>
        <div class="col-md-6">
            <select class="form-control form-control-user" id="exampleBloodType" name="bloodType" data-validations="required">
                <option disabled="" selected="true" value="">BLOOD TYPE - Select one</option>
                <%
                    for (BloodType bloodType : BloodType.values()) {%>
                <option value="<%= bloodType.getBloodType()%>"><%= bloodType.getBloodType()%></option>                   <%
                    }
                %>
            </select>
            <span class="error-validation"></span>
        </div>
    </div>
    <hr>
    <div id="guardianData" style="display: none">
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
    <button id="submitBtn" type="submit" class="btn btn-success btn-user btn-block">
        Create
    </button>
</form>

<script>

    function checkDate() {
        isOk = true;
        dateField = document.getElementById("exampleBirthday");
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

<script src="js/validations.js"></script>

<style>
    .error-validation {
        color: red;
        font-size: .7rem;
    }
</style>
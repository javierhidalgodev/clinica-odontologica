<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Relationship"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.BloodType"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div>
                <div class="p-5">
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4 text-left">Create a Patient!</h1>
                    </div>
                    <form class="user" action="SvPatients" method="POST">
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <input type="text" class="form-control form-control-user" id="exampleFirstName" name="patientFirstName" placeholder="First Name">
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control form-control-user" id="exampleSurname" name="patientSurname" placeholder="Surname">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <input type="text" class="form-control form-control-user" id="exampleInputAddress" name="patientAddress" placeholder="Address">
                            </div>
                            <div class="col-md-6 mb-3 mb-md-0">
                                <input type="tel" class="form-control form-control-user" id="examplePhone" name="patientPhone" placeholder="Phone">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6">
                                <input type="date" class="form-control form-control-user" id="exampleBirthday" name="patientBirthdate" onchange="checkDate()">
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control form-control-user" id="exampleDNI" name="dni" placeholder="patientDNI">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <select class="form-control form-control-user" id="examplePrepaidHealth" name="prepaidHealth">
                                    <option disabled="" selected="true" value="">PREPAID HEALTH - Select one</option>
                                    <option value="true">YES</option>
                                    <option value="false">NO</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <select class="form-control form-control-user" id="exampleBloodType" name="bloodType">
                                    <option disabled="" selected="true" value="">BLOOD TYPE - Select one</option>
                                    <%
                                        for (BloodType bloodType : BloodType.values()) {
                                    %> <option value="<%= bloodType.getBloodType()%>"><%= bloodType.getBloodType()%></option> <%
                                        }
                                    %>
                                    <!--                                    <option value="morning">Mañana</option>
                                                                        <option value="evening">Tarde</option>-->
                                </select>
                            </div>
                        </div>
                        <div id="guardianData" style="display: none">
                            <hr>
                            <h6>Guardian data</h6>
                            <div class="form-group row">
                                <div class="col-md-6 mb-3 mb-md-0">
                                    <input type="text" class="form-control form-control-user" id="exampleFirstName" name="guardianFirstName" placeholder="First Name">
                                </div>
                                <div class="col-md-6">
                                    <input type="text" class="form-control form-control-user" id="exampleSurname" name="guardianSurname" placeholder="Surname">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-6 mb-3 mb-md-0">
                                    <input type="text" class="form-control form-control-user" id="exampleInputAddress" name="guardianAddress" placeholder="Address">
                                </div>
                                <div class="col-md-6 mb-3 mb-md-0">
                                    <input type="tel" class="form-control form-control-user" id="examplePhone" name="guardianPhone" placeholder="Phone">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-6">
                                    <input type="date" class="form-control form-control-user" id="exampleBirthday" name="guardianBirthdate" onchange="checkDate()">
                                </div>
                                <div class="col-md-6">
                                    <input type="text" class="form-control form-control-user" id="exampleDNI" name="guardianDNI" placeholder="DNI">
                                </div>
                            </div>
                            <div class="form-group">
                                <select class="form-control form-control-user" id="exampleRelationship" name="relationship">
                                    <option disabled="" selected="true" value="">RELATIONSHIP - Select one</option>
                                    <%
                                        for (Relationship relationship : Relationship.values()) {
                                    %> <option value="<%= relationship.getRelationship()%>"><%= relationship.getRelationshipDescription()%></option> <%
                                        }
                                    %>
                                    <!--                                    <option value="morning">Mañana</option>
                                                                        <option value="evening">Tarde</option>-->
                                </select>
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

    function checkDate() {
        isOk = true;
        dateField = document.getElementById("exampleBirthday");
        dateValue = dateField.value;


        if (dateValue) {
            over18 = new Date(dateValue);
            over18.setFullYear(parseInt(over18.getFullYear()) + 18);
            today = new Date();
            guardianDataForm = document.getElementById("guardianData")
            
            if(over18 < today) {
                guardianDataForm.style.display = "none";
            } else {
                guardianDataForm.style.display = "block";
            }
        }
    }

</script>
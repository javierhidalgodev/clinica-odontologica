<%@page import="java.util.List"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@include file="layouts/firstPart.jsp" %>

<%

    List<Odontologo> availableOdontologists = (List) session.getAttribute("availableOdontologists");

%>

<div class="container">
    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div>
                <div class="p-5">
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4 text-left">Elija un profesional</h1>
                    </div>
                    <form class="user" action="SvAppointmentConfirmation" method="GET" id="form">
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <label for="odontologist">Professional</label>
                                <select class="form-control form-control-user" id="odontologist" name="odontologist" data-validations="required">
                                    <option selected value="">Select one</option>
                                    <%                    for (Odontologo o : availableOdontologists) {
                                    %> <option value="<%= o.getId()%>"><%= o.getName() + " / " + o.getSpecialization()%></option> <%
                                        }
                                    %>
                                    <!--                                    <option value="morning">Mañana</option>
                                                                        <option value="evening">Tarde</option>-->
                                </select>
                                <span id="errorAppointmentDate" class="error-validation"></span>
                            </div>
                            <!--                            <div class="col-md-6">
                                                            <input type="time" min="09:00" max="20:30" class="form-control form-control-user" id="appointmentHour" name="appointmentHour" data-validations="required">
                                                            <span id="errorAppointmentHour" class="error-validation"></span>
                                                        </div>-->
                        </div>
                        <button id="submitBtn" type="submit" class="btn btn-success btn-user btn-block">
                            Confirm appointment
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="layouts/endPart.jsp" %>

<script src="js/validations.js"></script>

<style>
    .error-validation {
        color: red;
        font-size: .7rem;
    }
</style>
<%@page import="java.util.List"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Paciente"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@include file="../../layouts/firstPart.jsp" %>

<%
    List<Paciente> patientsList = (List) session.getAttribute("patientList");
    String date = (String) session.getAttribute("appointmentDate");
    String hour = (String) session.getAttribute("appointmentHour");
    Paciente patient = (Paciente) session.getAttribute("appointmentPatient");
%>

<%
    if (patient != null) { %>
<%@include file="../../components/modalToContinue.jsp" %>
<%
    }
%>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb justify-content-between">
        <li class="breadcrumb-item" role="button">
            <span class="badge badge-pill badge-primary">1</span>
            Paciente y fecha
        </li>
        <li class="breadcrumb-item disabled no-divider" role="button"">
            <span class="badge badge-pill badge-dark">2</span>
            Profesional
        </li>
        <li class="breadcrumb-item disabled no-divider" role="button">
            <span class="badge badge-pill badge-dark">3</span>
            Confirmaci�n de la cita
        </li>
    </ol>
</nav>

<div class="card o-hidden border-0 shadow-lg">
    <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div>
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4 text-left">Elija una fecha y una hora</h1>
                </div>
                <form action="${pageContext.request.contextPath}/appointments/new/professional" method="POST" id="form">
                    <div class="form-group">
                        <label for="patient">Paciente</label>
                        <select class="form-control form-control-user" id="patient" name="patient" data-validations="required">
                            <option value="" selected>Seleccione una opci�n</option>
                            <%                    for (Paciente p : patientsList) {
                            %> <option
                                value="<%= p.getId()%>"
                                <%= (patient != null && patient.getId() == p.getId()) ? "selected" : ""%>>
                                <%= p.getName() + " / " + p.getBloodType()%></option> <%
                                    }
                                %>
                            <!--                                    <option value="morning">Ma�ana</option>
                                                                <option value="evening">Tarde</option>-->
                        </select>
                        <span id="errorAppointmentPatient" class="error-validation"></span>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-6 mb-3 mb-md-0">
                            <label for="appointmentDate">Fecha</label>
                            <input type="date" min="<%= LocalDate.now()%>" class="form-control form-control-user" id="appointmentDate" name="appointmentDate" value="<%= date != null ? date : ""%>" data-validations="required">
                            <span id="errorAppointmentDate" class="error-validation"></span>
                        </div>
                        <div class="col-md-6">
                            <label for="appointmentHour">Hora (elija el tramo de 00 o 30)</label>
                            <input type="time" min="09:00" max="20:30" step="1800" class="form-control form-control-user" id="appointmentHour" name="appointmentHour" value="<%= hour != null ? hour : ""%>" data-validations="required">
                            <span id="errorAppointmentHour" class="error-validation"></span>
                        </div>
                    </div>
                    <input type="hidden" name="step" value="1" />
                    <button id="submitBtn" type="submit" class="btn btn-success btn-user btn-block">
                        Selecci�n de profesional
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="../../layouts/endPart.jsp" %>

<script src="js/validations.js"></script>

<style>
    .error-validation {
        color: red;
        font-size: .7rem;
    }
</style>
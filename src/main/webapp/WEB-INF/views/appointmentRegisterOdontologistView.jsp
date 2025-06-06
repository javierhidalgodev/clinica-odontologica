<%@page import="java.util.List"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@include file="../../layouts/firstPart.jsp" %>

<%
    List<Odontologo> availableOdontologists = (List) request.getSession().getAttribute("availableOdontologists");
    Odontologo odontologist = (Odontologo) session.getAttribute("professional");
%>

<%
    if (odontologist != null) { %>
<%@include file="../../components/modalToContinue.jsp" %>
<%
    }
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
                    <form action="${pageContext.request.contextPath}/appointments/new/confirmation" method="POST" id="form">
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <label for="odontologist">Profesional</label>
                                <select class="form-control form-control-user" id="odontologist" name="odontologist" data-validations="required">
                                    <option selected value="">Seleccione una opción</option>
                                    <%                    for (Odontologo o : availableOdontologists) {
                                    %> <option
                                        value="<%= o.getId()%>"
                                        <%= (odontologist != null && odontologist.getId() == o.getId()) ? "selected" : "" %>>
                                        <%= o.getName() + " / " + o.getSpecialization()%></option> <%
                                        }
                                    %>
                                </select>
                                <span id="errorAppointmentDate" class="error-validation"></span>
                            </div>
                        </div>
                        <input type="hidden" name="step" value="2" />
                        <button id="submitBtn" type="submit" class="btn btn-success btn-user btn-block">
                            Confirmación de datos
                        </button>
                    </form>
                </div>
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
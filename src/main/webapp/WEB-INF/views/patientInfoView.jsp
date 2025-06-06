<%@page import="java.util.Iterator"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Turno"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Relationship"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Responsable"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Paciente"%>
<%@include file="../../layouts/firstPart.jsp" %>

<%
    String role = (String) request.getSession().getAttribute("userRole");

    Paciente patient = (Paciente) request.getAttribute("patient");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String patientBirth = sdf.format(patient.getBirthdate());

    Responsable guardian = patient.getGuardian();
%>

<div class="row">
    <div class="<%= guardian != null ? "col-xl-6 col-l-12" : "col-12"%>">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="d-flex justify-content-between align-items-center">
                    <span class="m-0 font-weight-bold text-primary">Información del paciente</span>
                    <% if ("admin".equals(role)) {%>
                    <div class="d-flex" id="actions">
                        <form action="${pageContext.request.contextPath}/patients/<%= patient.getId()%>" method="POST">
                            <input type="hidden" id="patientIdToEdit" name="id" value="<%= patient.getId()%>">
                            <input type="hidden" name="action" value="editing" />
                            <button type="submit" class="btn btn-success mr-2">
                                <i class="fas fa-solid fa-edit"></i>
                            </button>
                        </form>
                        <form id="form" action="patients" method="POST">
                            <input type="hidden" name="id" value="<%= patient.getId()%>">
                            <input type="hidden" name="action" value="delete" />
                        </form>
                        <button
                            type="button"
                            id="action-btn"
                            class="btn btn-danger"
                            data-action="delete"
                            data-toggle="modal"
                            data-target="#modal">
                            <i class="fas fa-solid fa-trash-alt"></i>
                        </button>
                    </div>
                    <% }%>
                </div>
            </div>
            <div class="card-body">
                <p>Nombre: <%= patient.getName()%></p>
                <p>Apellidos: <%= patient.getSurname()%></p>
                <p>Dirección: <%= patient.getAddress()%></p>
                <p>Teléfono: <%= patient.getPhone()%></p>
                <p>Fecha de nacimiento: <%= patientBirth%></p>
                <p>DNI: <%= patient.getDni()%></p>
                <p>Seguro médico: <%= patient.getPrepaidHealth() ? "Sí" : "No"%></p>
                <p>Grupo sanguíneo: <%= patient.getBloodType()%></p>

            </div>
        </div>
    </div>

    <div class="col-xl-6 col-l-12">
        <% if (guardian != null) {%>
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="d-flex justify-content-between align-items-center">
                    <span class="m-0 font-weight-bold text-primary">Información del responsable</span>
                    <% if ("adim".equals(role)) {%>
                    <div class="d-flex" id="guardianActions">
                        <form action="guardians" method="POST" data-form-action="edit">
                            <input type="hidden" id="guardianIdToDelete" name="guardianIdToDelete" value="<%= guardian.getId()%>">
                            <input type="hidden" name="action" value="editing" />
                            <button type="submit" class="btn btn-success">
                                <i class="fas fa-solid fa-edit"></i>
                            </button>
                        </form>

                        <%
                            LocalDate birth = LocalDate.parse(patientBirth);
                            LocalDate today = LocalDate.now();
                            Period period = Period.between(birth, today);

                            if (period.getYears() > 18) {
                        %>
                        <form action="guardians" method="POST" data-form-action="delete">
                            <input type="hidden" id="guardianIdToDelete" name="guardianIdToDelete" value="<%= guardian.getId()%>">
                            <input type="hidden" name="action" value="delete" />
                            <button type="submit" class="btn btn-danger">Eliminar</button>
                        </form>
                        <% }%>
                    </div>
                    <% }%>
                </div>
            </div>
            <!-- Card Content - Collapse -->

            <div class="card-body">
                <p>Nombre: <%= guardian.getName()%></p>
                <p>Apellidos: <%= guardian.getSurname()%></p>
                <p>Dirección: <%= guardian.getAddress()%></p>
                <p>Teléfono: <%= guardian.getPhone()%></p>
                <p>Fecha de nacimiento: <%= sdf.format(guardian.getBirthdate())%></p>
                <p>DNI: <%= guardian.getDni()%></p>
                <p>Relación: <%= Relationship.fromKey(guardian.getRelationship())%></p>
            </div>
        </div>
        <% }%>
    </div>
</div>

<% if ("admin".equals(role)) { %>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <div class="d-flex justify-content-between align-items-center">
            <span class="m-0 font-weight-bold text-primary">Citas programadas</span>
        </div>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Profesional</th>
                        <th>Fecha</th>
                        <th>Hora</th>
                        <th>Detalles</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>#</th>
                        <th>Profesional</th>
                        <th>Fecha</th>
                        <th>Hora</th>
                        <th>Detalles</th>                    </tr>
                </tfoot>
                <tbody>
                    <%
                        if (patient.getAppointments().size() > 0) {
                            int i = 0;

                            for (Turno t : patient.getAppointments()) {%>
                    <tr>
                        <td><%= i + 1%></td>
                        <td>Dr. <%= t.getOdontologist().getName()%> <%= t.getOdontologist().getSurname()%></td>            
                        <td>
                            <%
                                String appointmentDate = sdf.format(t.getAppointment());
                            %>
                            <%= appointmentDate%>
                        </td>
                        <td><%= t.getHour()%></td>
                        <td>
                            <form action="appointments/<%= t.getIdAppointment()%>" method="POST">
                                <input type="hidden" name="appointmentID" value="<%= t.getIdAppointment()%>" />
                                <button type="submit" class="btn btn-info">
                                    <i class="fas fa-solid fa-info-circle"></i>
                                </button>
                            </form>
                        </td>
                    </tr> <%

                            i++;
                        }
                    } else {
                    %>
                    <tr class="bg-gray-200 text-center font-weight-bold">
                        <td colspan="10">No data available</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<% }%>

<%@include file="../../components/modal.jsp" %>

<%@include file="../../layouts/endPart.jsp" %>
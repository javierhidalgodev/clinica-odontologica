<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Turno"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@include file="../../layouts/firstPart.jsp" %>

<%
    UserDTO userSession = (UserDTO) request.getSession(false).getAttribute("userSession");
    Odontologo odontologist = (Odontologo) request.getAttribute("odontologist");
%>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/odontologists">Odontólogos</a></li>
        <li class="breadcrumb-item" aria-current="page">Dr. <%= odontologist.getName()%> <%= odontologist.getSurname()%></li>
    </ol>
</nav>

<div class="card shadow mb-4">
    <div class="card-header py-3 d-flex justify-content-between align-items-center">
        <span class="m-0 font-weight-bold text-primary">Dr. <%= odontologist.getName()%> <%= odontologist.getSurname()%></span>
        <% if ("admin".equals(userSession.getRole())) {%>
        <div id="actions" class="d-flex" style="gap: 8px">
            <a href="${pageContext.request.contextPath}/odontologists/<%= odontologist.getId()%>?editing=true" role="button" class="btn btn-success">
                <i class="fas fa-solid fa-edit" style="width: 16px"></i>
            </a>
            <form action="${pageContext.request.contextPath}/odontologists/<%= odontologist.getId()%>" method="POST" id="form">
                <input type="hidden" name="id" value="<%= odontologist.getId()%>" />
                <input type="hidden" name="action" value="delete" />
                <button
                    type="button"
                    id="action-btn"
                    class="btn btn-danger"
                    data-action="delete"
                    data-toggle="modal"
                    data-target="#modal">
                    <i class="fas fa-solid fa-trash-alt" style="width: 16px"></i>
                </button>
            </form>

        </div>
        <% }%>
    </div>
    <div class="card-body">
        <p>Dirección: <%= odontologist.getAddress()%></p>
        <p>Teléfono: <%= odontologist.getPhone()%></p>
        <p>
            <%
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
                String formatDate = simpleDateFormat.format(odontologist.getBirthdate());
            %>
            Fecha de nacimiento: <%= formatDate%>
        </p>
        <p>DNI: <%= odontologist.getDni()%></p>
        <p>Especialidad: <%= odontologist.getSpecialization()%></p>
        <p>Turno de trabajo: <%= odontologist.getWorkSchedule() != null ? odontologist.getWorkSchedule().getName() + " / " + odontologist.getWorkSchedule().getEntryTime() + " - " + odontologist.getWorkSchedule().getExitTime() : "Not assigned"%></p>
        <% if (odontologist.getUser() != null) {%>
        <p>User: <%= odontologist.getUser().getUsername()%></p>
        <% } %>
    </div>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <span class="m-0 font-weight-bold text-primary">Agenga médica</span>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nombre del paciente</th>
                        <th>Fecha</th>
                        <th>Hora</th>
                        <th>Detalles</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>#</th>
                        <th>Nombre del paciente</th>
                        <th>Fecha</th>
                        <th>Hora</th>
                        <th>Detalles</th>
                    </tr>
                </tfoot>
                <tbody>
                    <%
                        if (odontologist.getWorkShift().size() > 0) {
                            int i = 0;

                            for (Turno t : odontologist.getWorkShift()) {%>

                    <tr>
                        <td><%= i + 1%></td>
                        <td><%= t.getPatient().getName()%></td>            
                        <td>
                            <%
                                String appointmentDate = simpleDateFormat.format(t.getAppointment());
                            %>
                            <%= appointmentDate%>
                        </td>
                        <td><%= t.getHour()%></td>
                        <td>
                            <form action="${pageContext.request.contextPath}/appointments/<%= t.getIdAppointment()%>" method="POST">
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

<%@include file="../../components/modal.jsp" %>

<%@include file="../../layouts/endPart.jsp" %>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Turno"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@include file="../../layouts/firstPart.jsp" %>

<% Odontologo odontologist = (Odontologo) request.getAttribute("odontologist");%>

<div class="position-fixed p-3 text-white text" style="bottom: 20px; right: 20px; z-index: 1000; background-color: rgba(32, 32, 32, .8)">
    Citas médicas programadas: <%= odontologist.getWorkShift().size()%>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <div class="d-flex justify-content-between align-items-center">
            <span class="m-0 font-weight-bold text-primary">Dr. <%= odontologist.getName()%> <%= odontologist.getSurname()%></span>
            <div class="d-flex" id="actions">
                <form action="odontologists?id=<%= odontologist.getId()%>" method="POST" class="mr-2">
                    <input type="hidden" name="action" value="editing" />
                    <input type="hidden" name="id" value="<%= odontologist.getId()%>" />
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-solid fa-edit"></i>
                    </button>
                </form>
                <form action="odontologists" method="POST" id="form">
                    <input type="hidden" name="id" value="<%= odontologist.getId()%>" />
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
        </div>
    </div>
    <div class="card-body">
        <p>Address: <%= odontologist.getAddress()%></p>
        <p>Phone: <%= odontologist.getPhone()%></p>
        <p>
            <%
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
                String formatDate = simpleDateFormat.format(odontologist.getBirthdate());
            %>
            Birthdate: <%= formatDate%>
        </p>
        <p>DNI: <%= odontologist.getDni()%></p>
        <p>Speciality: <%= odontologist.getSpecialization()%></p>
        <p>Work Schedule: <%= odontologist.getWorkSchedule() != null ? odontologist.getWorkSchedule().getName() + " / " + odontologist.getWorkSchedule().getEntryTime() + " - " + odontologist.getWorkSchedule().getExitTime() : "Not assigned"%></p>
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
                        <th>Patient name</th>
                        <th>Date</th>
                        <th>Hour</th>
                        <th>See more</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>#</th>
                        <th>Patient name</th>
                        <th>Date</th>
                        <th>Hour</th>
                        <th>See more</th>                    </tr>
                </tfoot>
                <tbody>
                    <%
                        if (odontologist.getWorkShift().size() > 0) {
                            int i = 0;

                            for (Turno t : odontologist.getWorkShift()) {%>

                    <% out.print(t.getIdAppointment());%>
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
                            <form action="appointment_info" method="GET">
                                <input type="hidden" name="appointmentID" value="<%= t.getIdAppointment()%>" />
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-solid fa-info-circle"></i>
                                </button>
                            </form>
                            <button class="btn btn-danger" data-toggle="modal" data-target="#deleteModal">
                                <i class="fas fa-solid fa-trash-alt"></i>
                            </button>
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
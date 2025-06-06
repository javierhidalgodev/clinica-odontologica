<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Turno"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@page import="java.util.List"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Usuario"%>
<%@page import="javax.swing.table.DefaultTableModel"%>

<%
    List<Turno> appointmentList = (List) session.getAttribute("appointmentList");
%>

<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
    <thead>
        <tr>
            <th>#</th>
            <th>Paciente</th>
            <th>Profesional</th>
            <th>Fecha</th>
            <th>Horarios</th>
            <th>Detalles</th>
        </tr>
    </thead>
    <tfoot>
        <tr>
            <th>#</th>
            <th>Paciente</th>
            <th>Profesional</th>
            <th>Fecha</th>
            <th>Horarios</th>
            <th>Detalles</th>
        </tr>
    </tfoot>
    <tbody>
        <%
            if (appointmentList != null && !appointmentList.isEmpty()) {
                int i = 0;

                for (Turno a : appointmentList) {%>
        <tr>
            <td><%= i + 1%></td>
            <td><%= a.getPatient().getName() + " " + a.getPatient().getSurname()%></td>
            <td>Dr. <%= a.getOdontologist().getName() + " " + a.getOdontologist().getSurname()%></td>
            <td>
                <%
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
                    String formatDate = simpleDateFormat.format(a.getAppointment());
                %>
                <%= formatDate%>
            </td>
            <td><%= a.getHour()%></td>
            <td>
                <form action="appointments/<%= a.getIdAppointment() %>" method="POST">
                    <input type="hidden" name="appointmentID" value="<%= a.getIdAppointment() %>" />
                    <button type="submit" class="btn btn-primary fas fa-solid fa-address-book"></button>
                </form>
            </td>
        </tr> <%

                i++;
            }
        } else {
        %>
        <tr class="bg-gray-200 text-center font-weight-bold">
            <td colspan="10">No hay datos disponibles</td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
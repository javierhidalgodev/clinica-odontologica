<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Paciente"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@page import="java.util.List"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Usuario"%>
<%@page import="javax.swing.table.DefaultTableModel"%>

<%
    List<Paciente> patientsList = (List<Paciente>) session.getAttribute("patientsList");
%>

<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
    <thead>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Date of birth</th>
            <th>DNI</th>
            <th>Details</th>
        </tr>
    </thead>
    <tfoot>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Date of birth</th>
            <th>DNI</th>
            <th>Details</th>
        </tr>
    </tfoot>
    <tbody>
        <%
            if (!patientsList.isEmpty()) {
                int i = 0;

                            for (Paciente p : patientsList) {%>
        <tr>
            <td><%= i + 1%></td>
            <td><%= p.getName() + " " + p.getSurname()%></td>
            <td><%= p.getAddress()%></td>
            <td><%= p.getPhone()%></td>
            <td>
                <%
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
                    String formatDate = simpleDateFormat.format(p.getBirthdate());
                %>
                <%= formatDate%>
            </td>
            <td><%= p.getDni()%></td>
            <td>
                <form action="SvPatientInfo" method="GET">
                    <input type="hidden" name="id" value="<%= p.getId()%>" />
                    <button type="submit" class="btn btn-primary">Details</button>
                </form>
            </td>                        
        </tr> <%

                i++;
            }
        } else {
        %>
        <tr class="bg-gray-200 text-center font-weight-bold">
            <td colspan="7">No data available</td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>


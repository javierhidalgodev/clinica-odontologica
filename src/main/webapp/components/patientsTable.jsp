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
            <th>Nombre</th>
            <th>DNI</th>
            <th>Detalles</th>
        </tr>
    </thead>
    <tfoot>
        <tr>
            <th>#</th>
            <th>Nombre</th>
            <th>DNI</th>
            <th>Detalles</th>
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
            <td><%= p.getDni()%></td>
            <td>
                <a role="button" href="${pageContext.request.contextPath}/patients/<%= p.getId()%>" class="btn btn-info w-fit">
                    <i class="fas fa-solid fa-info-circle"></i>
                </a>
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


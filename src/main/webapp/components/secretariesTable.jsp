<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Secretario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@page import="java.util.List"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Usuario"%>
<%@page import="javax.swing.table.DefaultTableModel"%>

<%
    List<Secretario> secretariesList = (List<Secretario>) session.getAttribute("secretariesList");
%>

<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
    <thead>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>DNI</th>
            <th>Profile</th>
        </tr>
    </thead>
    <tfoot>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>DNI</th>
            <th>Profile</th>
        </tr>
    </tfoot>
    <tbody>
        <%
            if (!secretariesList.isEmpty()) {
                int i = 0;

                for (Secretario s : secretariesList) {%>
        <tr>
            <td><%= i + 1%></td>
            <td><%= s.getName() + " " + s.getSurname()%></td>
            <td><%= s.getDni()%></td>
            <td>
                <form action="secretaries?id=<%= s.getId()%>" method="POST">
                    <input type="hidden" name="id" value="<%= s.getId()%>" />
                    <input type="hidden" name="action" value="getInfo" />
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
            <td colspan="9">No data available</td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
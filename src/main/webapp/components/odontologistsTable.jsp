<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@page import="java.util.List"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Usuario"%>
<%@page import="javax.swing.table.DefaultTableModel"%>

<%
    List<Odontologo> odontologistList = (List) request.getAttribute("odontologistList");
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
            if (odontologistList != null && !odontologistList.isEmpty()) {
                int i = 0;

                for (Odontologo o : odontologistList) {%>
        <tr>
            <td><%= i + 1%></td>
            <td><%= o.getName() + " " + o.getSurname()%></td>
            <td><%= o.getDni()%></td>
            <td>
                <form action="odontologists?id=<%= o.getId()%>" method="POST">
                    <input type="hidden" name="id" value="<%= o.getId()%>" />
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
            <td colspan="10">No data available</td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
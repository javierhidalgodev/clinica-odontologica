<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@page import="java.util.List"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Usuario"%>
<%@page import="javax.swing.table.DefaultTableModel"%>

<%
    List<Odontologo> odontologistsList = (List) request.getAttribute("odontologistsList");
%>

<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
    <thead>
        <tr>
            <th>#</th>
            <th class="w-100">Name</th>
            <th>Profile</th>
            <!--            <th>Edit</th>
                        <th>Delete</th>-->
        </tr>
    </thead>
    <tfoot>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Profile</th>
            <!--            <th>Edit</th>
                        <th>Delete</th>-->
        </tr>
    </tfoot>
    <tbody>
        <%
            if (!odontologistsList.isEmpty()) {
                int i = 0;

                for (Odontologo o : odontologistsList) {%>
        <tr>
            <td><%= i + 1%></td>
            <td><%= o.getName() + " " + o.getSurname()%></td>            
            <td>
                <a href="odontologist/<%= o.getId()%>" class="btn btn-success">
                    <i class="fas fa-solid fa-info-circle"></i>
                </a>
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
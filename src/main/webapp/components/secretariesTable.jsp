<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Secretario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@page import="java.util.List"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Usuario"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Secretario> secretariesList = (List<Secretario>) session.getAttribute("secretariesList");
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
            <th>Position</th>
            <th>Edit</th>
            <th>Delete</th>
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
            <th>Position</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
    </tfoot>
    <tbody>
        <%
            if (!secretariesList.isEmpty()) {
                int i = 0;

                    for (Secretario s : secretariesList) {%>
        <tr>
            <td><%= i + 1%></td>
            <td><%= s.getName() + " " + s.getSurname() %></td>
            <td><%= s.getAddress()%></td>
            <td><%= s.getPhone()%></td>
            <td>
                <%
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
                    String formatDate = simpleDateFormat.format(s.getBirthdate());
                %>
                <%= formatDate %>
            </td>
            <td><%= s.getDni() %></td>
            <td><%= s.getFloor()%></td>
            <td>
                <form action="SvSecretariesEdit" method="GET">
                    <input type="hidden" name="idToEdit" value="<%= s.getId()%>" />
                    <button type="submit" class="btn btn-primary">Editar</button>
                </form>
            </td>
            <td>
                <form action="SvSecretariesDelete" method="POST">
                    <input type="hidden" name="id" value="<%= s.getId()%>" />
                    <button type="submit" class="btn btn-danger">Eliminar</button>
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

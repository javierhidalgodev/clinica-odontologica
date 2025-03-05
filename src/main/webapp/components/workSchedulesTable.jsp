<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Horario"%>
<%@page import="java.util.List"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Usuario"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Horario> workSchedulesList = (List<Horario>) session.getAttribute("workSchedulesList");
%>

<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
    <thead>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Entry Time</th>
            <th>Exit Time</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
    </thead>
    <tfoot>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Entry Time</th>
            <th>Exit Time</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
    </tfoot>
    <tbody>
        <%
            if (!workSchedulesList.isEmpty()) {
                int i = 0;

                for (Horario ws : workSchedulesList) {%>
        <tr>
            <td><%= i + 1%></td>
            <td><%= ws.getName()%></td>
            <td><%= ws.getEntryTime()%></td>
            <td><%= ws.getExitTime()%></td>
            <td>
                <form action="SvUsersEdit" method="GET">
                    <input type="hidden" name="id" value="<%= ws.getIdWorkSchedule()%>" />
                    <button type="submit" href="SvUsersEdit" class="btn btn-primary">Editar</button>
                </form>
            </td>
            <td>
                <form action="SvUsersDelete" method="POST">
                    <input type="hidden" name="id" value="<%= ws.getIdWorkSchedule()%>" />
                    <button type="submit" class="btn btn-danger">Eliminar</button>
                </form>
            </td>
        </tr> <%

                i++;
            }
        } else {
        %>
        <tr class="bg-gray-200 text-center font-weight-bold">
            <td colspan="6">No data available</td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>

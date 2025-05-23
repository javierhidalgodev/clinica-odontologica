<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Horario"%>
<%@page import="java.util.List"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Usuario"%>
<%@page import="javax.swing.table.DefaultTableModel"%>

<%
    List<Horario> workSchedulesList = (List<Horario>) session.getAttribute("workScheduleList");
%>

<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
    <thead>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Details</th>
        </tr>
    </thead>
    <tfoot>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Details</th>
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
            <td>
                <form action="work-schedule?id=<%= ws.getIdWorkSchedule()%>" method="POST">
                    <input type="hidden" name="id" value="<%= ws.getIdWorkSchedule()%>" />
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
            <td colspan="6">No data available</td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
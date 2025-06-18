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
            <th>Nombre</th>
            <th>Detalles</th>
        </tr>
    </thead>
    <tfoot>
        <tr>
            <th>#</th>
            <th>Nombre</th>
            <th>Detalles</th>
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
                <a href="${pageContext.request.contextPath}/work-schedule/<%= ws.getIdWorkSchedule()%>" role="button" class="btn btn-info w-fit">
                    <i class="fas fa-solid fa-info-circle"></i>
                </a>
            </td>
        </tr> <%

                i++;
            }
        } else {
        %>
        <tr class="bg-gray-200 text-center font-weight-bold">
            <td colspan="6">No hay datos disponibles</td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
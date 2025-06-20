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
            <th>Nombre</th>
            <th>DNI</th>
            <th>Perfil</th>
        </tr>
    </thead>
    <tfoot>
        <tr>
            <th>#</th>
            <th>Nombre</th>
            <th>DNI</th>
            <th>Perfil</th>
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
                <a role="button" href="${pageContext.request.contextPath}/odontologists/<%= o.getId()%>" class="btn btn-info w-fit">
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
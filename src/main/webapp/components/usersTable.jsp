<%@page import="com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Usuario"%>
<%@page import="javax.swing.table.DefaultTableModel"%>

<%
    List<UserDTO> userList = (List) session.getAttribute("userList");
%>

<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
    <thead>
        <tr>
            <th>#</th>
            <th>Username</th>
            <th>Role</th>
            <th>Details</th>
        </tr>
    </thead>
    <tfoot>
        <tr>
            <th>#</th>
            <th>Username</th>
            <th>Role</th>
            <th>Details</th>
        </tr>
    </tfoot>
    <tbody>
        <%
            if (!userList.isEmpty()) {
                int i = 0;

                for (UserDTO u : userList) {%>
        <tr>
            <td class="w-fit"><%= i + 1%></td>
            <td class="w-50"><%= u.getUsername()%></td>
            <td class="w-50"><%= u.getRole()%></td>
            <td class="w-fit">
                <form action="users?id=<%= u.getId()%>" method="POST">
                    <input type="hidden" name="id" value="<%= u.getId()%>" />
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
            <td colspan="5">No data available</td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>



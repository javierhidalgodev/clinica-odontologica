<%@page import="java.util.List"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Usuario"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Usuario> userList = (List<Usuario>) session.getAttribute("userList");
%>

<div class="card shadow mb-4">
    <!--    <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>-->
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Username</th>
                        <th>Role</th>
                        <th>Edit</th>
                        <th>Delet</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>#</th>
                        <th>Username</th>
                        <th>Role</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </tfoot>
                <tbody>
                    <%
                        if (!userList.isEmpty()) {
                            int i = 0;

                            for (Usuario u : userList) {%>
                    <tr>
                        <td class="w-fit"><%= i + 1%></td>
                        <td class="w-50"><%= u.getUsername()%></td>
                        <td class="w-50"><%= u.getRole()%></td>
                        <td class="w-fit">
                            <form action="SvUsersEdit" method="GET">
                                <input type="hidden" name="id" value="<%= u.getIdUser()%>" />
                                <button type="submit" href="SvUsersEdit" class="btn btn-primary">Editar</button>
                            </form>
                        </td>
                        <td class="w-fit">
                            <form action="SvUsersDelete" method="POST">
                                <input type="hidden" name="id" value="<%= u.getIdUser()%>" />
                                <button type="submit" class="btn btn-danger">Eliminar</button>
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
        </div>
    </div>
</div>
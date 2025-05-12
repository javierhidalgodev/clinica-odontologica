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
            <td><%= s.getName() + " " + s.getSurname()%></td>
            <td><%= s.getAddress()%></td>
            <td><%= s.getPhone()%></td>
            <td>
                <%
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
                    String formatDate = simpleDateFormat.format(s.getBirthdate());
                %>
                <%= formatDate%>
            </td>
            <td><%= s.getDni()%></td>
            <td><%= s.getFloor()%></td>
            <td>
                <form action="secretaries?id=<%= s.getId()%>" method="POST">
                    <input type="hidden" name="id" value="<%= s.getId()%>" />
                    <input type="hidden" name="action" value="editing" />
                    <button type="submit" class="btn btn-primary fas fa-edit"></button>
                </form>
            </td>
            <td>
                <form action="secretaries" method="POST" data-form-action="delete">
                    <input type="hidden" name="id" value="<%= s.getId()%>" />
                    <input type="hidden" name="action" value="delete" />
                    <button type="submit" class="btn btn-danger fas fa-trash-alt"></button>
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

<script>
    deleteForms = document.querySelectorAll("[data-form-action=delete]");

    function confirmDelete(ev) {
        ev.preventDefault();

        confirmation = confirm("¿Estás seguro de que deseas eliminar el registro? Esta operación es irreversible.");

        if (confirmation) {
            ev.target.submit();
        }
    }

    deleteForms.forEach(dF => {
        dF.addEventListener("submit", confirmDelete);
    })
</script>
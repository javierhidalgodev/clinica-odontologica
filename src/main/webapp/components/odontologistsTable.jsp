<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@page import="java.util.List"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Usuario"%>
<%@page import="javax.swing.table.DefaultTableModel"%>

<%
    List<Odontologo> odontologistsList = (List) session.getAttribute("odontologistsList");
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
            <th>Specialization</th>
            <th>Work Schedule</th>
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
            <th>Specialization</th>
            <th>Work Schedule</th>
            <th>Edit</th>
            <th>Delete</th>
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
            <td><%= o.getAddress()%></td>
            <td><%= o.getPhone()%></td>
            <td>
                <%
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
                    String formatDate = simpleDateFormat.format(o.getBirthdate());
                %>
                <%= formatDate%>
            </td>
            <td><%= o.getDni()%></td>
            <td><%= o.getSpecialization()%></td>
            <td><%= o.getWorkSchedule() != null ? o.getWorkSchedule().getName() + " / " + o.getWorkSchedule().getEntryTime() + " - " + o.getWorkSchedule().getExitTime() : "Not assigned"%></td>
            <td>
                <form action="SvOdontologistsEdit" method="GET">
                    <input type="hidden" name="id" value="<%= o.getId()%>" />
                    <button type="submit" class="btn btn-primary fas fa-edit"></button>
                </form>
            </td>
            <td>
                <form action="SvOdontologistsDelete" method="POST" data-form-action="delete">
                    <input type="hidden" name="idToDelete" value="<%= o.getId()%>" />
                    <button type="submit" class="btn btn-danger fas fa-trash-alt"></button>
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
    
    <script>
        deleteForms = document.querySelectorAll("[data-form-action=delete]");
        
        function confirmDelete(ev) {
            ev.preventDefault();
            
            confirmation = confirm("�Seguro que desea eliminar el registro? Esta operaci�n es irreversible");
            
            if(confirmation) {
                ev.target.submit();
            }
        }
        
        deleteForms.forEach(f => f.addEventListener("submit", confirmDelete))
        
    </script>
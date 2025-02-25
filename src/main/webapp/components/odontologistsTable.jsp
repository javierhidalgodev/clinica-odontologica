<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@page import="java.util.List"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Usuario"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Odontologo> odontologistsList = (List<Odontologo>) session.getAttribute("odontologistsList");
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
                        <td><%= o.getName() + " " + o.getSurname() %></td>
                        <td><%= o.getAddress()%></td>
                        <td><%= o.getPhone()%></td>
                        <td>
                            <%
                                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
                                String formatDate = simpleDateFormat.format(o.getBirthdate());
                            %>
                            <%= formatDate %>
                        </td>
                        <td><%= o.getDni() %></td>
                        <td><%= o.getSpecialization() %></td>
                        <td><%= o.getWorkSchedule() != null ? o.getWorkSchedule().getExitTime() + " - " + o.getWorkSchedule().getExitTime() : "Not assigned" %></td>
                        <td>
                            <form action="SvUsersEdit" method="GET">
                                <input type="hidden" name="id" value="<%= o.getId()%>" />
                                <button type="submit" href="SvUsersEdit" class="btn btn-primary">Editar</button>
                            </form>
                        </td>
                        <td>
                            <form action="SvUsersDelete" method="POST">
                                <input type="hidden" name="id" value="<%= o.getId()%>" />
                                <button type="submit" class="btn btn-danger">Eliminar</button>
                            </form>
                        </td>
                    </tr> <%

                            i++;
                        }
                    } else {
                    %>
                    <tr class="bg-gray-200 text-center font-weight-bold">
                        <td colspan="8">No data available</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>

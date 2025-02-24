<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    </tr>
                </tfoot>
                <tbody>
                    <%
                        if (!odontologistsList.isEmpty()) {
                            int i = 0;

                                for (Odontologo o : odontologistsList) {%>
                    <tr>
                        <td class="w-fit"><%= i + 1%></td>
                        <td class="w-50"><%= o.getName() + " " + o.getSurname() %></td>
                        <td class="w-50"><%= o.getAddress()%></td>
                        <td class="w-50"><%= o.getPhone()%></td>
                        <td class="w-50"><fmt:formatDate value="${o.getBirthday()}" pattern="dd-MM-yyyy"/></td>
                        <td class="w-50"><%= o.getDni() %></td>
                        <td class="w-50"><%= o.getSpecialization() %></td>
                        <td class="w-50"><%= o.getWorkSchedule().getEntryTime() + " - " + o.getWorkSchedule().getExitTime() %></td>
                        <td class="w-fit">
                            <form action="SvUsersEdit" method="GET">
                                <input type="hidden" name="id" value="<%= o.getId()%>" />
                                <button type="submit" href="SvUsersEdit" class="btn btn-primary">Editar</button>
                            </form>
                        </td>
                        <td class="w-fit">
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
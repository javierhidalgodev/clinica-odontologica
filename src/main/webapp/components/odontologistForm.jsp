<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Horario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Horario> workScheduleList = (List<Horario>) session.getAttribute("workScheduleList");
%>

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div>
                <div class="p-5">
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4 text-left">Create an Odontologist!</h1>
                    </div>
                    <form class="user" action="SvOdontologists" method="POST">
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <input type="text" class="form-control form-control-user" id="exampleFirstName" name="firstName" placeholder="First Name" required>
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control form-control-user" id="exampleSurname" name="surname" placeholder="Surname" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <input type="text" class="form-control form-control-user" id="exampleInputAddress" name="address" placeholder="Address" required>
                            </div>
                            <div class="col-md-6 mb-3 mb-md-0">
                                <input type="tel" class="form-control form-control-user" id="examplePhone" name="phone" placeholder="Phone" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6">
                                <input type="date" class="form-control form-control-user" id="exampleBirthday" name="birthday" required>
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control form-control-user" id="exampleDNI" name="dni" placeholder="DNI" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <input type="text" class="form-control form-control-user" id="exampleSpecialization" name="specialization" placeholder="Specialization">
                            </div>
                            <div class="col-md-6">
                                <select class="form-control form-control-user" id="exampleWorkSchedule" name="workSchedule" required>
                                    <option selected>Select one</option>
                                    <%
                                        for(Horario wS : workScheduleList) {
                                    %> <option value="<%= wS.getName()%>"><%= wS.getName() + " / " + wS.getEntryTime() %> -  <%= wS.getExitTime() %></option> <%
                                        }
                                    %>
<!--                                    <option value="morning">Mañana</option>
                                    <option value="evening">Tarde</option>-->
                                </select>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success btn-user btn-block">
                            Create
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
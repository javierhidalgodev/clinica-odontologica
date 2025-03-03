<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Horario"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Odontologo odontologistToEdit = (Odontologo) session.getAttribute("odontologistToEdit");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String birth = sdf.format(odontologistToEdit.getBirthdate());

    List<Horario> workScheduleList = (List<Horario>) session.getAttribute("workScheduleList");
    String odontologistWorkSchedule = odontologistToEdit.getWorkSchedule() != null ? odontologistToEdit.getWorkSchedule().getName() : "not assigned";
%>

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div>
                <div class="p-5">
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4 text-left">Edit an Odontologist!</h1>
                    </div>
                    <form class="user" action="SvOdontologistsEdit" method="POST">
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <input type="text" class="form-control form-control-user" id="exampleFirstName" name="firstName" value="<%= odontologistToEdit.getName()%>" placeholder="First Name">
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control form-control-user" id="exampleSurname" name="surname" value="<%= odontologistToEdit.getSurname()%>" placeholder="Surname">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <input type="text" class="form-control form-control-user" id="exampleInputAddress" name="address" value="<%= odontologistToEdit.getAddress()%>" placeholder="Address">
                            </div>
                            <div class="col-md-6 mb-3 mb-md-0">
                                <input type="tel" class="form-control form-control-user" id="examplePhone" name="phone" value="<%= odontologistToEdit.getPhone()%>" placeholder="Phone">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6">
                                <input type="date" class="form-control form-control-user" id="exampleBirthdate" name="birthdate" value="<%= birth%>">
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control form-control-user" id="exampleDNI" name="dni" value="<%= odontologistToEdit.getDni()%>" placeholder="DNI" disabled="">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6">
                                <input type="text" class="form-control form-control-user" id="exampleSpecialization" name="specialization" value="<%= odontologistToEdit.getSpecialization()%>" placeholder="Specialization">
                            </div>
                            <div class="col-md-6">
                                <label for="exampleWorkSchedule" class="text-xs">Work Schedule (Actual: <%= odontologistWorkSchedule %>)</label>
                                <select class="form-control form-control-user" id="exampleWorkSchedule" name="workSchedule">
                                    <option disabled="" value="">Select one to change</option>
                                    <%
                                        for(Horario wS : workScheduleList) {
                                        %> <option value="<%= wS.getIdWorkSchedule() %>"><%= wS.getName() + " / " + wS.getEntryTime() %> -  <%= wS.getExitTime() %></option> <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-success btn-user btn-block font-weight-bold">
                            Edit
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
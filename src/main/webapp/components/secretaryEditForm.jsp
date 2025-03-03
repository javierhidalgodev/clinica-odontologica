<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Secretario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Secretario secretaryToEdit = (Secretario) session.getAttribute("secretaryToEdit");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String birth = sdf.format(secretaryToEdit.getBirthdate());
    
%>

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div>
                <div class="p-5">
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4 text-left">Edit a Secretary!</h1>
                    </div>
                    <form class="user" action="SvSecretariesEdit" method="POST">
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <input type="text" class="form-control form-control-user" id="exampleFirstName" name="firstName" placeholder="First Name" value="<%= secretaryToEdit.getName()%>">
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control form-control-user" id="exampleSurname" name="surname" placeholder="Surname" value="<%= secretaryToEdit.getSurname()%>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <input type="text" class="form-control form-control-user" id="exampleInputAddress" name="address" placeholder="Address" value="<%= secretaryToEdit.getAddress()%>">
                            </div>
                            <div class="col-md-6 mb-3 mb-md-0">
                                <input type="tel" class="form-control form-control-user" id="examplePhone" name="phone" placeholder="Phone" value="<%= secretaryToEdit.getPhone()%>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6">
                                <input type="date" class="form-control form-control-user" id="exampleBirthday" name="birthday" value="<%= birth %>">
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control form-control-user" id="exampleDNI" name="dni" placeholder="DNI" value="<%= secretaryToEdit.getDni() %>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <input type="text" class="form-control form-control-user" id="examplefloor" name="floor" placeholder="Position" value="<%= secretaryToEdit.getFloor() %>">
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
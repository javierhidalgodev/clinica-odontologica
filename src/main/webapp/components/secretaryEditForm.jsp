<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Secretario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Secretario secretaryToEdit = (Secretario) session.getAttribute("secretaryToEdit");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String birth = sdf.format(secretaryToEdit.getBirthdate());
%>

<form class="user" action="SvSecretariesEdit" method="POST">
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <input type="text" class="form-control form-control-user" id="exampleFirstName" name="firstName" placeholder="First Name" value="<%= secretaryToEdit.getName()%>" required>
        </div>
        <div class="col-md-6">
            <input type="text" class="form-control form-control-user" id="exampleSurname" name="surname" placeholder="Surname" value="<%= secretaryToEdit.getSurname()%>" required>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <input type="text" class="form-control form-control-user" id="exampleInputAddress" name="address" placeholder="Address" value="<%= secretaryToEdit.getAddress()%>" required>
        </div>
        <div class="col-md-6 mb-3 mb-md-0">
            <input type="tel" class="form-control form-control-user" id="examplePhone" name="phone" placeholder="Phone" value="<%= secretaryToEdit.getPhone()%>" required>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6">
            <input type="date" class="form-control form-control-user" id="exampleBirthday" name="birthday" value="<%= birth%>">
        </div>
        <div class="col-md-6">
            <input type="text" class="form-control form-control-user" id="exampleDNI" name="dni" placeholder="DNI" value="<%= secretaryToEdit.getDni()%>" disabled required>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <input type="text" class="form-control form-control-user" id="examplefloor" name="floor" placeholder="Position" value="<%= secretaryToEdit.getFloor()%>">
        </div>
    </div>
    <button type="submit" class="btn btn-success btn-user btn-block font-weight-bold">
        Edit
    </button>
</form>
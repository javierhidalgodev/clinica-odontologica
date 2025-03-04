<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layouts/firstPart.jsp" %>
<%
    Paciente patient = (Paciente) session.getAttribute("patientDetails");
%>



<p>Name: <%= patient.getName()%></p>
<p>Surname: <%= patient.getSurname()%></p>
<p>Address: <%= patient.getAddress()%></p>
<p>Phone: <%= patient.getPhone()%></p>
<p>DNI: <%= patient.getDni()%></p>
<p>Blood type: <%= patient.getBloodType()%></p>
<p>DNI: <%= patient.getDni()%></p>
<p>Prepaid Health: <%= patient.getPrepaidHealth() ? "Sí" : "No"%></p>

<% if (patient.getGuardian() != null) {%>
<h4>Guardian</h4>
<p><%= patient.getGuardian().getName()%></p>
<% }%>

<%@include file="layouts/endPart.jsp" %>
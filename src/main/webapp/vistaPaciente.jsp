<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    Paciente patient = (Paciente) session.getAttribute("patientDetails");
%>

<!DOCTYPE html>
<html lang="en">

    <%@include file="components/head.jsp" %>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <%@include file="components/sideBar.jsp" %>

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <%@include file="components/topBar.jsp" %>

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Detalles del paciente</h1>
                        </div>
                        
                        <p>Name: <%= patient.getName() %></p>
                        <p>Surname: <%= patient.getSurname()%></p>
                        <p>Address: <%= patient.getAddress()%></p>
                        <p>Phone: <%= patient.getPhone()%></p>
                        <p>DNI: <%= patient.getDni()%></p>
                        <p>Blood type: <%= patient.getBloodType()%></p>
                        <p>DNI: <%= patient.getDni()%></p>
                        <p>Prepaid Health: <%= patient.getPrepaidHealth() ? "Sí" : "No" %></p>
                        
                        <% if(patient.getGuardian() != null) { %>
                            <h4>Guardian</h4>
                            <p><%= patient.getGuardian().getName() %></p>
                        <% } %>
                        <%@include file="components/footer.jsp" %>

                    </div>
                    <!-- End of Content Wrapper -->

                </div>
                <!-- End of Page Wrapper -->

            </div>

            <%@include file="components/toTopBtn.jsp" %>

            <%@include file="components/logoutModal.jsp" %>

            <%@include file="components/bootstrapCore.jsp" %>

    </body>

</html>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    Paciente patient = (Paciente) request.getAttribute("patientDetails");
    System.out.println(patient.getName());
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
                        
                        <p><%= patient.getBloodType() %></p>

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
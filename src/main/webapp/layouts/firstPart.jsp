<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Paciente"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="../auth.jsp" %>

<%    UserDTO userSession = (UserDTO) session.getAttribute("userSession");

%>

<!DOCTYPE html>
<html lang="en">

    <%@include file="../components/head.jsp" %>

    <body id="page-top">

        <div class="position-fixed p-3 text-white text" style="bottom: 20px; right: 20px; z-index: 1000; background-color: rgba(32, 32, 32, .8)">
            <%                Iterator<String> elementos = session.getAttributeNames().asIterator();

                while (elementos.hasNext()) {
                    String nombre = elementos.next();
            %> 
            <p class="m-1"><%= nombre%></p>
            <% }
               %>

        </div>

        <!-- Page Wrapper -->
        <div id="wrapper">

            <%@include file="../components/sideBar.jsp" %>

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content" class="mb-5">

                    <%@include file="../components/topBar.jsp" %>

                    <!-- Begin Page Content -->
                    <div class="container-fluid">
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

        <%--<%@include file="../components/debbuger.jsp" %>--%>

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
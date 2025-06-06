<%@page import="com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">

    <%@include file="../../components/head.jsp" %>

    <body>

        <div class="container">

            <!-- Outer Row -->
            <%@include file="../../components/registerForm.jsp" %>

        </div>

        <%@include file="../../components/bootstrapCore.jsp" %>
    </body>

</html>

<style>
    body {
        background-color: #106cb5
    }

    .form-control {
        height: auto;
        padding: 0.7rem 1rem !important;
    }

    .btn-user {
        padding: .7rem;
    }

    .btn:not(.btn-user):not(.btn-modal) {
        aspect-ratio: 1/1;
    }

    .error-validation {
        color: red;
        font-size: .7rem;
    }
</style>
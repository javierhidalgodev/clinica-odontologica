<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Horario"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Secretario"%>
<%@page import="java.util.List"%>

<%
    Horario workScheduleToEdit = (Horario) session.getAttribute("workScheduleToEdit");
%>

<form
    id="form"
    action="${pageContext.request.contextPath}/work-schedule/<%= workScheduleToEdit.getIdWorkSchedule() %>" 
    method="POST">
    <div class="form-group">
        <label for="wSName">Nombre</label>
        <input type="text" class="form-control form-control-user" id="wSName" name="WSName" value="<%= workScheduleToEdit.getName()%>" data-validations="required|minLength:2|maxLength:30">
        <!--            <span id="errorFirstName" class="error-validation"></span>-->
    </div>
    <div class="form-group row">
        <div class="col-md-6">
            <label for="entryTime">Entrada</label>
            <input type="time" class="form-control form-control-user" id="entryTime" name="entryTime" value="<%= workScheduleToEdit.getEntryTime()%>">
            <!--            <span id="errorSurname" class="error-validation"></span>-->
        </div>
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="exitTime">Salida</label>
            <input type="time" class="form-control form-control-user" id="exitTime" name="exitTime"value="<%= workScheduleToEdit.getExitTime()%>">
            <!--            <span id="errorAddress" class="error-validation"></span>-->
        </div>
    </div>
    <input type="hidden" name="action" value="edit" />
    <button
        type="button"
        id="action-btn"
        role="validations"
        class="btn btn-success btn-user btn-block font-weight-bold"
        data-action="edit"
        data-toggle="modal"
        data-target="#modal">
        Editar
    </button>
</form>

<%@include file="modal.jsp" %>

<!--<script src="js/validations.js"></script>-->

<style>
    .error-validation {
        color: red;
        font-size: .7rem;
    }
</style>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Horario"%>
<%@page import="java.util.List"%>

<form action="${pageContext.request.contextPath}/work-schedule/new" method="POST">
    <div class="form-group">
        <label for="workScheduleName">Nombre</label>
        <input type="text" class="form-control form-control-user" id="workScheduleName" name="WSName" placeholder="">
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="entryTime">Entrada</label>
            <input type="time" class="form-control form-control-user" id="entryTime" name="entryTime">
        </div>
        <div class="col-md-6 mb-3 mb-md-0">
            <label for="exitTime">Salida</label>
            <input type="time" class="form-control form-control-user" id="exitTime" name="exitTime">
        </div>
    </div>
    <input type="hidden" name="action" value="create" />
    <button
        id="submitBtn"
        type="submit"
        role="validations"
        class="btn btn-success btn-user btn-block">
        Create
    </button>
</form>
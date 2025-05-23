<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Horario"%>
<%@page import="java.util.List"%>

<form class="user" action="${pageContext.request.contextPath}/work-schedule" method="POST">
    <div class="form-group">
        <input type="text" class="form-control form-control-user" id="exampleWSName" name="WSName" placeholder="Name">
    </div>
    <div class="form-group row">
        <div class="col-md-6 mb-3 mb-md-0">
            <label class="text-xs font-weight-bold pl-2" for="entryTime">Entry Time</label>
            <input type="time" class="form-control form-control-user" id="entryTime" name="entryTime">
        </div>
        <div class="col-md-6 mb-3 mb-md-0">
            <label class="text-xs font-weight-bold pl-2" for="exitTime">Exit Time</label>
            <input type="time" class="form-control form-control-user" id="exitTime" name="exitTime">
        </div>
    </div>
    <input type="hidden" name="action" value="create" />
    <button type="submit" class="btn btn-success btn-user btn-block">
        Create
    </button>
</form>
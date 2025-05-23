<%@include file="../../layouts/firstPart.jsp" %>

<div class="card shadow mb-4">
    <div class="card-header py-3 d-flex justify-content-between align-items-center">
        <h6 class="m-0 font-weight-bold text-primary">Patients</h6>
        <a href="patients/new" class="btn btn-success mr-2">Add +</a>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <%@include file="../../components/patientsTable.jsp" %>
        </div>
    </div>
</div>


<%@include file="../../layouts/endPart.jsp" %>

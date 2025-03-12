<%@include file="layouts/firstPart.jsp" %>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Secretaries</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <%@include file="components/secretariesTable.jsp" %>
        </div>
    </div>
</div>

<%@include file="layouts/endPart.jsp" %>

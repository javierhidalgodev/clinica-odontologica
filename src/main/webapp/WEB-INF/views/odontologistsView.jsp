<%@include file="../../layouts/firstPart.jsp" %>

<%
    UserDTO userSession = (UserDTO) request.getSession(false).getAttribute("userSession");
%>

<div class="card shadow mb-4">
    <div class="card-header py-3 d-flex justify-content-between align-items-center">
        <h6 class="m-0 font-weight-bold text-primary">Odontólogos</h6>
        <% if (userSession.getRole().equals("admin")) { %>
        <a href="odontologists/new" class="btn btn-success mr-2">
            <i class="fas fa-solid fa-plus-circle"></i>
        </a>
        <% }%>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <%@include file="../../components/odontologistsTable.jsp" %>
        </div>
    </div>
</div>

<%@include file="../../layouts/endPart.jsp" %>
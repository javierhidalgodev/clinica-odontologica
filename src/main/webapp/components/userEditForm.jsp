<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Usuario"%>

<% Usuario userToEdit = (Usuario) session.getAttribute("userToEdit");%>

<form id="form" class="user" action="users" method="POST">
    <div class="form-group row">
        <div class="col-md-6 mb-3 col-md-0">
            <input type="text" class="form-control form-control-user" id="exampleUsername" name="username" placeholder="Username" value="<%= userToEdit.getUsername()%>" disabled>
        </div>
        <div class="col-md-6">
            <select class="form-control form-control-user" id="exampleRole" name="role" required>
                <option value="NA">---</option>
                <option value="admin" <%= userToEdit.getRole().equals("admin") ? "selected" : ""%> >Admin</option>
                <option value="user" <%= userToEdit.getRole().equals("user") ? "selected" : ""%> >User</option>
            </select>
        </div>
    </div>
    <input type="hidden" name="action" value="edit" />
    <button
        type="button"
        id="action-btn"
        class="btn btn-success btn-user btn-block font-weight-bold"
        data-action="edit"
        data-toggle="modal"
        data-target="#modal">
        Editar
    </button>
</form>

<%@include file="modal.jsp" %>
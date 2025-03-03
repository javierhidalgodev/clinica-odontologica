<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% Usuario userToEdit = (Usuario) session.getAttribute("userToEdit"); %>

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div>
                <div class="p-5">
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4 text-left">Edit an User!</h1>
                    </div>
                    <form class="user" action="SvUsersEdit" method="POST">
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 col-md-0">
                                <input type="text" class="form-control form-control-user" id="exampleUsername" name="username" placeholder="Username" value="<%= userToEdit.getUsername() %>" disabled>
                            </div>
                            <div class="col-md-6">
                                <select class="form-control form-control-user" id="exampleRole" name="role" required>
                                    <option value="NA">---</option>
                                    <option value="admin" <%= userToEdit.getRole().equals("admin") ? "selected" : "" %> >Admin</option>
                                    <option value="user" <%= userToEdit.getRole().equals("user") ? "selected" : "" %> >User</option>
                                </select>
                            </div>
                        </div>
                        
                        <button type="submit" class="btn btn-success btn-user btn-block">
                            Edit
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
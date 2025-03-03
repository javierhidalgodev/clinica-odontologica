<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div>
                <div class="p-5">
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4 text-left">Create an User!</h1>
                    </div>
                    <form class="user" action="SvUsers" method="POST">
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 col-md-0">
                                <input type="text" class="form-control form-control-user" id="exampleUsername" name="username"
                                       placeholder="Username" required>
                            </div>
                            <div class="col-md-6">
                                <select class="form-control form-control-user" id="exampleRole" name="role" required>
                                    <option value="NA">---</option>
                                    <option value="admin">Admin</option>
                                    <option value="user">User</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 col-md-0">
                                <input type="password" class="form-control form-control-user" name="password"
                                       id="exampleInputPassword" placeholder="Password" required>
                            </div>
                            <div class="col-md-6">
                                <input type="password" class="form-control form-control-user"
                                       id="exampleRepeatPassword" placeholder="Repeat Password" required>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success btn-user btn-block">
                            Create
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
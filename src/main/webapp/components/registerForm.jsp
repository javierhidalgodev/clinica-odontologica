<%
    Boolean userExists = (Boolean) request.getAttribute("userExists");
%>

<div class="flex flex-column items-center mt-5">
    <div class="w-100" style="height: 50px; background-image: url('./img/logo-vitaldent.png'); background-size: contain; background-position: center; background-repeat: no-repeat"></div>
    <div class="col-12">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-6 d-none d-lg-block" style="background-image: url('img/clinica-dental.jpeg'); background-position: center; background-size: cover"></div>
                    <div class="col-lg-6">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Creación de cuenta</h1>
                            </div>
                            <form action="register" method="POST" id="form">
                                <% if (userExists != null && userExists) { %>
                                <div id="errorUserExists" class="alert alert-danger small d-flex justify-content-sm-between align-items-center">
                                    <span>Ese nombre de usuario ya ha sido utilizado</span>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>

                                </div>
                                <%
                                    }
                                %>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="inputUsername" name="username" aria-describedby="usernameHelp" placeholder="Nombre de usuario" data-validations="required|minLength:5|maxLength:20">
                                    <span id="errorUsername" class="error-validation"></span>
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" class="form-control form-control-user" id="inputPassword" placeholder="Contraseña" data-validations="required|minLength:8|maxLength:20|password">
                                    <span id="errorPassword" class="error-validation"></span>
                                </div>
                                <div class="form-group">
                                    <input type="password" name="repeatpassword" class="form-control form-control-user" id="inputRepeatPassword" placeholder="Repita la contraseña" data-validations="required|confirmPassword">
                                    <span id="errorConfirmPassword" class="error-validation"></span>
                                </div>
                                <div class="form-group">
                                    <select name="role" class="form-control form-control-user" id="exampleSelectRole" data-validations="required|role">
                                        <option value="" disabled selected>Seleccione un rol</option>
                                        <option value="admin">Admin</option>
                                        <option value="user">User</option>
                                    </select>
                                    <span id="errorRole" class="error-validation"></span>
                                </div>
                                <button id="submitBtn"  type="submit" class="btn btn-primary btn-user btn-block">
                                    Registrar
                                </button>
                            </form>
                            <p class="text-xs text-center mt-3 mb-0">
                                ¿Ya tienes una cuenta?
                                <a href="login">Inicia sesión aquí</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/validations.js"></script>

<style>

</style>
<%
    Boolean invalidCredentials = (Boolean) request.getAttribute("invalidCredentials");
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
                                <h1 class="h4 text-gray-900 mb-4">¡Bienvenido!</h1>
                            </div>
                            <% if (invalidCredentials != null && invalidCredentials) { %>
                            <div id="errorUserExists" class="alert alert-danger small d-flex justify-content-sm-between align-items-center">
                                <span>Credenciales incorrectas</span>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>

                            </div>
                            <%
                                }
                            %>

                            <form action="login" method="POST">
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="inputUsername" name="username" aria-describedby="usernameHelp" placeholder="Nombre de usuario">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" class="form-control form-control-user" id="inputPassword" placeholder="Contraseña">
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-checkbox small">
                                        <input type="checkbox" class="custom-control-input" id="customCheck">
                                        <label class="custom-control-label" for="customCheck">Recuérdame</label>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary btn-user btn-block">
                                    Iniciar sesión
                                </button>
                            </form>
                            <p class="text-xs text-center mt-3 mb-0">
                                ¿Todavía no tiene una cuenta?
                                <a href="register">Regístrate aquí</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/validations.js"></script>


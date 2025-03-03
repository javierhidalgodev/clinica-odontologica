<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                <h1 class="h4 text-gray-900 mb-4">Create your account here!</h1>
                            </div>
                            <form class="user" action="SvRegister" method="POST">
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user"
                                           id="exampleInputUsername" name="username" aria-describedby="usernameHelp"
                                           placeholder="Username" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" class="form-control form-control-user"
                                           id="exampleInputPassword" placeholder="Password" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" name="repeatpassword" class="form-control form-control-user"
                                           id="exampleInputRepeatPassword" placeholder="Repeat password" required>
                                </div>
                                <div class="form-group">
                                    <select name="role" class="form-control form-control-user" id="exampleSelectRole" required>
                                        <option value="NA" disabled selected>Select one role</option>
                                        <option value="admin">Admin</option>
                                        <option value="user">User</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary btn-user btn-block">
                                    Register
                                </button>
                            </form>
                            <p class="text-xs text-center mt-3 mb-0">
                                Do you have an account?
                                 <a href="login.jsp">Login here</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>

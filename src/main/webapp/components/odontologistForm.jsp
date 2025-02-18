<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div>
                <div class="p-5">
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4 text-left">Create an Odontologist!</h1>
                    </div>
                    <form class="user">
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <input type="text" class="form-control form-control-user" id="exampleFirstName"
                                       placeholder="First Name">
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control form-control-user" id="exampleSurname"
                                       placeholder="Surname">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 mb-md-0">
                            <input type="text" class="form-control form-control-user" id="exampleInputAddress"
                                   placeholder="Address">
                            </div>
                            <div class="col-md-6 mb-3 mb-md-0">
                                <input type="tel" class="form-control form-control-user" id="examplePhone"
                                       placeholder="Phone">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <input type="tel" class="form-control form-control-user" id="exampleSpecialization"
                                       placeholder="Specialization">
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control form-control-user" id="exampleDNI"
                                       placeholder="DNI">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <input type="password" class="form-control form-control-user"
                                       id="exampleInputPassword" placeholder="Password">
                            </div>
                            <div class="col-md-6">
                                <input type="password" class="form-control form-control-user"
                                       id="exampleRepeatPassword" placeholder="Repeat Password">
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
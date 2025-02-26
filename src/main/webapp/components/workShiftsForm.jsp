<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Horario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div>
                <div class="p-5">
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4 text-left">Create a new Work Shift!</h1>
                    </div>
                    <form class="user" action="SvWorkSchedule" method="POST">
                        <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="exampleWSName" name="WSName" placeholder="Name">
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <label class="text-xs font-weight-bold pl-2" for="entryTime">Entry Time</label>
                                <input type="time" class="form-control form-control-user" id="entryTime" name="entryTime">
                            </div>
                            <div class="col-md-6 mb-3 mb-md-0">
                                <label class="text-xs font-weight-bold pl-2" for="exitTime">Exit Time</label>
                                <input type="time" class="form-control form-control-user" id="exitTime" name="exitTime">
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
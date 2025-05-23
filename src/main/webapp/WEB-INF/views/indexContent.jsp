<%@page import="com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO"%>

<%

    String odontologistsCount = (String) session.getAttribute("odontologistsCount");
    String secretariesCount = (String) session.getAttribute("secretariesCount");
    String patientsCount = (String) session.getAttribute("patientsCount");
    String appointmentsCount = (String) session.getAttribute("appointmentsCount");

%>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-4 text-gray-800">Welcome ${userSession.getUsername()}!</h1>
</div>

<div class="row">

    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                            Professionals</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%= odontologistsCount %></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-solid fa-stethoscope fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                            Secretaries</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%= secretariesCount %></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-solid fa-briefcase fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
 
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-info shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Pacientes
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%= patientsCount %></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-solid fa-hospital-user fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-warning shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                            Appointments</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%= appointmentsCount %></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-solid fa-calendar fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
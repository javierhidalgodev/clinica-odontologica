<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@include file="../auth.jsp" %>--%>

<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-solid fa-tooth"></i>
        </div>
        <div class="sidebar-brand-text mx-3 text-left">Consultorio Odontológico</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href="index.html">
            <i class="fas fa-solid fa-bars"></i>
            <span>Menú</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Gestión
    </div>

    <!-- Nav Item - Odontologist Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOdontologist"
           aria-expanded="true" aria-controls="collapseOdontologist">
            <i class="fas fa-solid fa-stethoscope"></i>
            <span>Odontólogos</span>
        </a>
        <div id="collapseOdontologist" class="collapse" aria-labelledby="headingOdontologist" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Acciones</h6>
                <a class="collapse-item" href="SvOdontologists">Ver profesionales</a>
                <a class="collapse-item" href="SvWSToOdonto">Nuevo profesional</a>
            </div>
        </div>
    </li>

        <!-- Nav Item - Secretaries Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSecretaries"
           aria-expanded="true" aria-controls="collapseSecretaries">
            <i class="fas fa-solid fa-briefcase"></i>
            <span>Secretarios</span>
        </a>
        <div id="collapseSecretaries" class="collapse" aria-labelledby="headingSecretaries" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Acciones</h6>
                <a class="collapse-item" href="SvSecretaries">Ver profesionales</a>
                <a class="collapse-item" href="altaSecretario.jsp">Nuevo profesional</a>
            </div>
        </div>
    </li>
    
    <!-- Nav Item - Patients Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePatients"
           aria-expanded="true" aria-controls="collapsePatients">
            <i class="fas fa-solid fa-hospital-user"></i>
            <span>Pacientes</span>
        </a>
        <div id="collapsePatients" class="collapse" aria-labelledby="headingPatients"
             data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Acciones</h6>
                <a class="collapse-item" href="SvPatients">Ver pacientes</a>
                <a class="collapse-item" href="altaPaciente.jsp">Nuevo paciente</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Users Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUsers"
           aria-expanded="true" aria-controls="collapseUsers">
            <i class="fas fa-solid fa-users"></i>
            <span>Usuarios</span>
        </a>
        <div id="collapseUsers" class="collapse" aria-labelledby="headingUsers"
             data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Acciones</h6>
                <a class="collapse-item" href="SvUsers">Ver usuarios</a>
                <a class="collapse-item" href="altaUsuario.jsp">Nuevo usuario</a>
            </div>
        </div>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseWorkSchedule"
           aria-expanded="true" aria-controls="collapseWorkSchedule">
            <i class="fas fa-solid fa-clock"></i>
            <span>Horarios de trabajo</span>
        </a>
        <div id="collapseWorkSchedule" class="collapse" aria-labelledby="headingWorkSchedule"
             data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Acciones</h6>
                <a class="collapse-item" href="SvWorkSchedule">Ver horarios</a>
                <a class="collapse-item" href="altaHorario.jsp">Nuevo horario</a>
            </div>
        </div>
    </li>
    <!--             Heading 
                <div class="sidebar-heading">
                    Addons
                </div>
    
                 Nav Item - Pages Collapse Menu 
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                        aria-expanded="true" aria-controls="collapsePages">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Pages</span>
                    </a>
                    <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Login Screens:</h6>
                            <a class="collapse-item" href="login.html">Login</a>
                            <a class="collapse-item" href="register.html">Register</a>
                            <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                            <div class="collapse-divider"></div>
                            <h6 class="collapse-header">Other Pages:</h6>
                            <a class="collapse-item" href="404.html">404 Page</a>
                            <a class="collapse-item" href="blank.html">Blank Page</a>
                        </div>
                    </div>
                </li>
    
                 Nav Item - Charts 
                <li class="nav-item">
                    <a class="nav-link" href="charts.html">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Charts</span></a>
                </li>
    
                 Nav Item - Tables 
                <li class="nav-item">
                    <a class="nav-link" href="tables.html">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Tables</span></a>
                </li>
    
                 Divider 
                <hr class="sidebar-divider d-none d-md-block">-->

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

    <!-- Sidebar Message -->
    <!--            <div class="sidebar-card d-none d-lg-flex">
                    <img class="sidebar-card-illustration mb-2" src="img/undraw_rocket.svg" alt="...">
                    <p class="text-center mb-2"><strong>SB Admin Pro</strong> is packed with premium features, components, and more!</p>
                    <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a>
                </div>-->

</ul>
<!-- End of Sidebar -->
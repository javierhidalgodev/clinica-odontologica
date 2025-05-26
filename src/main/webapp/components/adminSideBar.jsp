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
            <a class="collapse-item" href="${pageContext.request.contextPath}/odontologists">Ver profesionales</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/odontologists/new">Nuevo profesional</a>
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
            <a class="collapse-item" href="${pageContext.request.contextPath}/secretaries">Ver profesionales</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/secretaries/new">Nuevo profesional</a>
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
            <a class="collapse-item" href="${pageContext.request.contextPath}/patients">Ver pacientes</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/patients/new">Nuevo paciente</a>
        </div>
    </div>
</li>

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
            <a class="collapse-item" href="${pageContext.request.contextPath}/work-schedule">Ver horarios</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/work-schedule/new">Nuevo horario</a>
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
            <a class="collapse-item" href="${pageContext.request.contextPath}/users">Ver usuarios</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/users/new">Nuevo usuario</a>
        </div>
    </div>
</li>

<!-- Divider -->
<hr class="sidebar-divider">

<div class="sidebar-heading">
    Gestión de pacientes
</div>

<li class="nav-item">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseAppointments"
       aria-expanded="true" aria-controls="collapseApointments">
        <i class="fas fa-solid fa-calendar"></i>
        <span>Citas</span>
    </a>
    <div id="collapseAppointments" class="collapse" aria-labelledby="headingAppointments"
         data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Acciones</h6>
            <a class="collapse-item" href="${pageContext.request.contextPath}/appointments">Ver citas</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/appointments/new/patient">Citar paciente</a>
        </div>
    </div>
</li>
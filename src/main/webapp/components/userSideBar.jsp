<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Secretario"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Persona"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO"%>

<%
    UserDTO userSession = (UserDTO) request.getSession(false).getAttribute("userSession");
%>

<% if (userSession.getProfessional() instanceof Secretario) { %>
<li class="nav-item">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOdontologists"
       aria-expanded="true" aria-controls="collapseOdontologists">
        <i class="fas fa-solid fa-hospital-user"></i>
        <span>Odontólogos</span>
    </a>
    <div id="collapseOdontologists" class="collapse" aria-labelledby="headingOdontologists"
         data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Acciones</h6>
            <a class="collapse-item" href="${pageContext.request.contextPath}/odontologists">Ver odontólogos</a>
        </div>
    </div>
</li>
<% }%>

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
        </div>
    </div>
</li>

<li class="nav-item">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseAppointments"
       aria-expanded="true" aria-controls="collapseAppointments">
        <i class="fas fa-solid fa-briefcase"></i>
        <span>Citas</span>
    </a>
    <div id="collapseAppointments" class="collapse" aria-labelledby="headingAppointments" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Acciones</h6>
            <a class="collapse-item" href="${pageContext.request.contextPath}/appointments">Ver citas programadas</a>
        </div>
    </div>
</li>

<% if (userSession.getProfessional() instanceof Odontologo) { %>
<li class="nav-item">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSchedule"
       aria-expanded="true" aria-controls="collapseSchedule">
        <i class="fas fa-solid fa-calendar"></i>
        <span>Turnos</span>
    </a>
    <div id="collapseSchedule" class="collapse" aria-labelledby="headingSchedule" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Acciones</h6>
            <a class="collapse-item" href="#">Ver mis planillas</a>
        </div>
    </div>
</li>
<% } else { %>
<li class="nav-item">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseWorkSchedules"
       aria-expanded="true" aria-controls="collapseWorkSchedules">
        <i class="fas fa-solid fa-calendar"></i>
        <span>Horarios</span>
    </a>
    <div id="collapseWorkSchedules" class="collapse" aria-labelledby="headingWorkSchedules" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Acciones</h6>
            <a class="collapse-item" href="${pageContext.request.contextPath}/work-schedule">Ver horarios</a>
        </div>
    </div>
</li>

<li class="nav-item">
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUsers"
       aria-expanded="true" aria-controls="collapseUsers">
        <i class="fas fa-solid fa-calendar"></i>
        <span>Usuarios</span>
    </a>
    <div id="collapseUsers" class="collapse" aria-labelledby="headingUsers" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Acciones</h6>
            <a class="collapse-item" href="${pageContext.request.contextPath}/users">Ver usuarios</a>
        </div>
    </div>
</li>
<% } %>
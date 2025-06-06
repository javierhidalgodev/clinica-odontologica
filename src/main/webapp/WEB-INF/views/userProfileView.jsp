<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Secretario"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Odontologo"%>
<%@page import="com.javierhidalgodev.clinicaodontologica.logica.Persona"%>
<%@include file="../../layouts/firstPart.jsp" %>

<%
    UserDTO user = (UserDTO) request.getSession(false).getAttribute("userSession");
    Persona professional = user.getProfessional();
%>

<div class="container">
    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div>
                <div class="p-5">
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4 text-left">Perfil</h1>
                    </div>
                    <% if (professional != null) {%>
                    <p>Nombre: <%= professional.getName()%></p>
                    <p>Apellido: <%= professional.getSurname()%></p>
                    <p>Fecha de nacimiento: <%= professional.getBirthdate().toLocaleString()%></p>
                    <p>DNI: <%= professional.getDni()%></p>
                    <p>Teléfono: <%= professional.getPhone()%></p>
                    <%
                        if (professional instanceof Odontologo) {
                            Odontologo odonto = (Odontologo) professional;
                    %> <p>Profesional: odontólogo</p>
                    <p>Horario <%= odonto.getWorkSchedule().getEntryTime()%> - <%= odonto.getWorkSchedule().getExitTime()%> </p> <%
                    } else {
                        Secretario secre = (Secretario) professional;
                    %> <p>Profesional: secretario</p>
                    <p>Puesto: <%= secre.getFloor()%></p> <%
                        }
                    %>
                    <% } else { %>
                    <p class="text-muted">No hay profesional asignado</p>
                    <% }%>
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4 text-left">Usuario</h1>
                    </div>
                    <p>Usuario: <%= user.getUsername()%></p>
                    <p>Rol: <%= user.getRole()%></p>
                </div>
            </div>
        </div>
    </div>

</div>

<%@include file="../../layouts/endPart.jsp" %>
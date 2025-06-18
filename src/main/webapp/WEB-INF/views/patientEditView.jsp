<%@include file="../../layouts/firstPart.jsp" %>

<%
    Paciente patientInfo = (Paciente) request.getAttribute("patient");
%>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/patients">Pacientes</a></li>
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/patients/<%= patientInfo.getId()%>"><%= patientInfo.getName() + " " + patientInfo.getSurname()%></a></li>
        <li class="breadcrumb-item" aria-current="page">Edición</li>
    </ol>
</nav>


<div class="card o-hidden border-0 shadow-lg my-2">
    <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div>
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4 text-left">Edición de paciente</h1>
                </div>
                <%@include file="../../components/patientEditForm.jsp" %>
            </div>
        </div>
    </div>
</div>

<%@include file="../../layouts/endPart.jsp" %>
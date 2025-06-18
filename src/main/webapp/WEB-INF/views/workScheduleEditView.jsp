<%@include file="../../layouts/firstPart.jsp" %>

<%
    Horario workScheduleInfo = (Horario) session.getAttribute("workScheduleToEdit");
%>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/work-schedule">Horarios de trabajo</a></li>
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/work-schedule/<%= workScheduleInfo.getIdWorkSchedule()%>"><%= workScheduleInfo.getName()%></a></li>
        <li class="breadcrumb-item" aria-current="page">Edición</li>
    </ol>
</nav>

<div class="container">
    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div>
                <div class="p-5">
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4 text-left">Edición de horario de trabajo</h1>
                    </div>
                    <%@include file="../../components/workScheduleEditForm.jsp" %>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../../layouts/endPart.jsp" %>

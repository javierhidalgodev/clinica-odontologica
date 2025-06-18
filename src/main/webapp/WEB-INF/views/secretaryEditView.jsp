<%@include file="../../layouts/firstPart.jsp" %>

<%
    Secretario secretaryInfo = (Secretario) session.getAttribute("secretaryToEdit");
%>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/secretaries">Secretarios</a></li>
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/secretaries/<%= secretaryInfo.getId()%>"><%= secretaryInfo.getName() + secretaryInfo.getSurname()%></a></li>
        <li class="breadcrumb-item" aria-current="page">Edici�n</li>
    </ol>
</nav>

<div class="card o-hidden border-0 shadow-lg my-2">
    <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div>
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4 text-left">Edici�n de secretario</h1>
                </div>
                <%@include file="../../components/secretaryEditForm.jsp" %>
            </div>
        </div>
    </div>
</div>

<%@include file="../../layouts/endPart.jsp" %>

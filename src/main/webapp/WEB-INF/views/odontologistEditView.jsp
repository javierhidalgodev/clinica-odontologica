<%@include file="../../layouts/firstPart.jsp" %>

<%
    Odontologo odontoInfo = (Odontologo) session.getAttribute("odontologistToEdit");
%>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/odontologists">Odontólogos</a></li>
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/odontologists/<%= odontoInfo.getId()%>">Dr. <%= odontoInfo.getName() + odontoInfo.getSurname()%></a></li>
        <li class="breadcrumb-item" aria-current="page">Edición</li>
    </ol>
</nav>

<div class="card o-hidden border-0 shadow-lg my-2">
    <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div>
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4 text-left">Edición de odontólogo</h1>
                </div>
                <%@include file="../../components/odontologistEditForm.jsp" %>
            </div>
        </div>
    </div>
</div>

<%@include file="../../layouts/endPart.jsp" %>


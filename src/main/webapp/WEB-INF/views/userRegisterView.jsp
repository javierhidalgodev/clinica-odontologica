<%@include file="../../layouts/firstPart.jsp" %>

<div class="card o-hidden border-0 shadow-lg">
    <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div>
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4 text-left">Nuevo usuario</h1>
                </div>
                <%@include file="../../components/userForm.jsp" %>
            </div>
        </div>
    </div>
</div>

<%@include file="../../layouts/endPart.jsp" %>
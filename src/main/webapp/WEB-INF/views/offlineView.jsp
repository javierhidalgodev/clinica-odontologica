<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@include file="../../components/head.jsp" %>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper" style="height: 100dvh">


            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column" style="height: 100%; justify-content: space-between">

                <!-- 404 Error Text -->
                <div class="text-center my-auto">
                    <div class="error mx-auto" data-text="500">500</div>
                    <p class="lead text-gray-800 mb-5">Offline mamón</p>
                    <a href="${pageContext.request.contextPath}/login">&larr; Volver al login</a>
                </div>

                <%@include file="../../components/footer.jsp" %>

            </div>
        </div>
    </body>

</html>

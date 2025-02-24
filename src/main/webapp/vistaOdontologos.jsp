<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@include file="components/head.jsp" %>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <%@include file="components/sideBar.jsp" %>

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <%@include file="components/topBar.jsp" %>

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Vista de ondontólogos</h1>
                        </div>
                        
                        <%@include file="components/odontologistsTable.jsp" %>

                        <%@include file="components/footer.jsp" %>

                    </div>
                    <!-- End of Content Wrapper -->

                </div>
                <!-- End of Page Wrapper -->

            </div>

            <%@include file="components/toTopBtn.jsp" %>

            <%@include file="components/logoutModal.jsp" %>

            <%@include file="components/bootstrapCore.jsp" %>

    </body>

</html>
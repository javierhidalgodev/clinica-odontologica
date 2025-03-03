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
                            <h1 class="h3 mb-0 text-gray-800">Edición de odontólogo</h1>
                        </div>
                        
                        <%@include file="components/odontologistEditForm.jsp" %>

                        <%@include file="components/footer.jsp" %>

                    </div>
                    <!-- End of Content Wrapper -->

                </div>
                <!-- End of Page Wrapper -->

            </div>

            <!-- Scroll to Top Button-->
            <%@include file="components/toTopBtn.jsp" %>

            <!-- Logout Modal-->
            <%@include file="components/logoutModal.jsp" %>
            
            <%@include file="components/bootstrapCore.jsp" %>

    </body>

</html>
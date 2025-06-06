</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

</div>

<!-- Scroll to Top Button-->
<%@include file="../components/toTopBtn.jsp" %>

<!-- Logout Modal-->
<%@include file="../components/logoutModal.jsp" %>

<!-- Bootstrap core JavaScript-->
<%@include file="../components/bootstrapCore.jsp" %>

</body>

</html>

<style>
    .form-control {
        height: auto;
        padding: 0.7rem 1rem !important;
    }

    .btn-user {
        padding: .7rem;
    }

    .btn:not(.btn-user):not(.btn-modal) {
        aspect-ratio: 1/1;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .error-validation {
        color: red;
        font-size: .7rem;
    }

    .sidebar {
        width: 10rem;
        min-height: 100vh;
    }

    @media (min-width: 768px) {
        .sidebar.toggled {
            overflow: visible;
            width: 10rem !important;
            align-items: center;
        }
    }
</style>

<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Cerrar sesi�n</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fa fa-solid fa-times"></i></span>
                </button>
            </div>
            <div class="modal-body">�Est�s seguro de que quieres cerrar esta sesi�n?</div>
            <div class="modal-footer">
                <button class="btn btn-secondary btn-modal" type="button" data-dismiss="modal">Cancel</button>
                <form action="${pageContext.request.contextPath}/logout" method="get">
                    <button type="submit" class="btn btn-primary btn-modal">Logout</button>
                </form>
            </div>
        </div>
    </div>
</div>
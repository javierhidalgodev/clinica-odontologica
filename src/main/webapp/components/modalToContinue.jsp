<div class="modal fade" id="modalToContinue" data-id="modalToContinue" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true" data-show="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">Continuar operaci�n</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fa fa-solid fa-times"></i></span>
                </button>
            </div>
            <div class="modal-body" id="modalBody">Ya hab�a un proceso anterior de grabaci�n de cita �Quieres continuar con ese proceso, o empezar uno nuevo?</div>
            <div class="modal-footer">
                <button class="btn btn-secondary btn-modal" type="button" data-dismiss="modal">Continuar</button>
                <a role="button" href="${pageContext.request.contextPath}/appointments/reset" class="btn btn-success btn-modal" id="modal-action-btn">Empezar</a>
            </div>
        </div>
    </div>
</div>

<script>
    window.addEventListener("load", function () {
        const modalToContinue = new bootstrap.Modal(document.getElementById("modalToContinue"));
        modalToContinue.show();
    })
</script>

<!--<script>
        const mainForm = document.getElementById("form");
        const modalActionBtn = document.getElementById("modal-action-btn");
        modalActionBtn.addEventListener("click", () => {
            mainForm.submit();
        })
    
        // Obtenci�n del bot�n que invoca el modal
        // y extracci�n de la data necesaria para el modal
        const actionBtn = document.getElementById("action-btn");
        const dataAction = actionBtn.getAttribute("data-action");


        // Obtenci�n de los inputs para setear la data,
        // del contenedor del modal
        // y del formulario
        const modalTitle = document.getElementById("modalTitle");
        const modalBody = document.getElementById("modalBody");
        // 
        // Seteo la data en los inputs del formulario,
        // el id del modal para su invocaci�n
        // y el action del formulario
        if (dataAction === "delete") {
            modalTitle.textContent = "Eliminar registro"
            modalBody.textContent = "Si elimina el registro, no podr� recuperar los datos �Est� seguro de realizar la operaci�n?"
            modalActionBtn.textContent = "Eliminar"
            modalActionBtn.classList.add("btn-danger")
        } else {
            modalTitle.textContent = "Editar registro"
            modalBody.textContent = "�Est� seguro de que quiere editar este registro?"
            modalActionBtn.textContent = "Editar"
            modalActionBtn.classList.add("btn-success")
        }
</script>-->
<div class="modal fade" id="modal" data-id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle" />
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fa fa-solid fa-times"></i></span>
                </button>
            </div>
            <div class="modal-body" id="modalBody"></div>
            <div class="modal-footer">
                <button class="btn btn-secondary btn-modal" type="button" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-modal" id="modal-action-btn" />
            </div>
        </div>
    </div>
</div>

<script>
        const mainForm = document.getElementById("form");
        const modalActionBtn = document.getElementById("modal-action-btn");
        modalActionBtn.addEventListener("click", (ev) => {
            mainForm.dispatchEvent(new Event("submit", { cancelable: true }));
        })
    
        // Obtención del botón que invoca el modal
        // y extracción de la data necesaria para el modal
        const actionBtn = document.getElementById("action-btn");
        const dataAction = actionBtn.getAttribute("data-action");

        // Obtención de los inputs para setear la data,
        // del contenedor del modal
        // y del formulario
        const modalTitle = document.getElementById("modalTitle");
        const modalBody = document.getElementById("modalBody");
        // 
        // Seteo la data en los inputs del formulario,
        // el id del modal para su invocación
        // y el action del formulario
        if (dataAction === "delete") {
            modalTitle.textContent = "Eliminar registro"
            modalBody.textContent = "Si elimina el registro, no podrá recuperar los datos ¿Está seguro de realizar la operación?"
            modalActionBtn.textContent = "Eliminar"
            modalActionBtn.classList.add("btn-danger")
        } else {
            modalTitle.textContent = "Editar registro"
            modalBody.textContent = "¿Está seguro de que quiere editar este registro?"
            modalActionBtn.textContent = "Editar"
            modalActionBtn.classList.add("btn-success")
        }
</script>
const form = document.getElementById("form");

function validateForm(ev) {
    ev.preventDefault();

    isValid = true;

    form.querySelectorAll("[data-validations]").forEach(field => {
        rules = field.dataset.validations.split("|");
        value = field.value.trim();
        message = null;

        rules.forEach(rule => {
            if (message != null)
                return;

            if (rule === "required" && value === "") {
                message = "Campo requerido";
            } else if (rule.startsWith("minLength")) {
                min = parseInt(rule.split(":")[1]);
                if (value.length < min)
                    message = `El campo debe tener al menos ${min} caracteres`;
            } else if (rule.startsWith("maxLength")) {
                max = parseInt(rule.split(":")[1]);
                if (value.length > max)
                    message = `El campo debe tener menos de ${max} caracteres`;
            } else if (rule == "phone") {
                phonePattern = /^[0-9]{9,14}$/;
                if (!phonePattern.test(value))
                    message = "El teléfono debe tener en 9 y 14 dígitos";
            } else if (rule == "birthdate") {
                today = new Date();
                over18 = new Date(value);
                over18.setFullYear(over18.getFullYear() + 18);
                if (over18 > today)
                    message = "Debe ser mayor de edad";
            } else if (rule == "dni") {
                const dniPattern = /^[0-9]{8}[a-zA-Z]{1}$/;
                if (!dniPattern.test(value))
                    message = "DNI mal formado (8 dígitos y 1 letra)";
            }
        });

        if (message != null) {
            showError(field, message);
            isValid = false;
        } else {
            field.nextElementSibling.textContent = "";
        }
    });
    
    if(isValid) form.submit();
}

function showError(field, message) {
    spanError = field.nextElementSibling;

    spanError.textContent = message;
}

form.addEventListener("submit", validateForm);
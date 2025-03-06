const form = document.getElementById("form");
const fields = document.querySelectorAll("[data-validations]");
const submitBtn = document.getElementById("submitBtn");

function validateField(ev) {
    const field = ev.target;
    
    if(field.offsetParent === null) {
        return true;
    }
    
    const rules = field.dataset.validations.split("|");
    const value = field.value.trim();
    let message = null;

    rules.forEach(rule => {
        if (message !== null)
            return;

        if (rule === "required" && value === "") {
            message = "Campo requerido";
        } else if (rule.startsWith("minLength")) {
            const min = parseInt(rule.split(":")[1]);
            if (value.length < min)
                message = `El campo debe tener al menos ${min} caracteres`;
        } else if (rule.startsWith("maxLength")) {
            const max = parseInt(rule.split(":")[1]);
            if (value.length > max)
                message = `El campo debe tener menos de ${max} caracteres`;
        } else if (rule === "phone") {
            const phonePattern = /^[0-9]{9,14}$/;
            if (!phonePattern.test(value))
                message = "El teléfono debe tener en 9 y 14 dígitos";
        } else if (rule === "birthdate") {
            const today = new Date();
            let over18 = new Date(value);
            over18.setFullYear(over18.getFullYear() + 18);
            if (over18 > today)
                message = "Debe ser mayor de edad";
        } else if (rule === "dni") {
            const dniPattern = /^[0-9]{8}[a-zA-Z]{1}$/;
            if (!dniPattern.test(value))
                message = "DNI mal formado (8 dígitos y 1 letra)";
        }
    });

    if (message !== null) {
        showError(field, message);
        submitBtn.disabled = true;
        return false;
    } else {
        field.nextElementSibling.textContent = "";
        submitBtn.disabled = false;

        return true;
    }
}

function validateForm(ev) {
    ev.preventDefault();

    let isValid = Array.from(fields).every(field => validateField({target: field}));

    if (isValid)
        form.submit();
}

function showError(field, message) {
    const spanError = field.nextElementSibling;
    spanError.textContent = message;
}

fields.forEach(f => f.addEventListener("change", validateField));
form.addEventListener("submit", validateForm);
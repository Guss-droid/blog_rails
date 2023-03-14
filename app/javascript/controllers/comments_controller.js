import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() { }
  connect() { }
  toggleForm(event) {
    event.preventDefault();
    event.stopPropagation();
    const formId = event.params["form"];
    const commentBodyId = event.params["body"];
    const editButtonId = event.params["edit"];

    const form = document.getElementById(formId);
    form.classList.toggle("d-none");
    form.classList.toggle("mt-4");

    const body = document.getElementById(commentBodyId);
    body.classList.toggle("d-none");

    const edit = document.getElementById(editButtonId);
    this.toggleEditButtonText(edit);
  }

  toggleEditButtonText(edit) {
    if (edit.innerText === "Edit") {
      edit.innerText = "Cancel";
      this.toggleEditButtonClass(edit);
    } else {
      edit.innerText = "Edit";
      this.toggleEditButtonClass(edit);
    }
  }

  toggleEditButtonClass(edit) {
    edit.classList.toggle("btn-secondary");
    edit.classList.toggle("btn-warning");
  }
}

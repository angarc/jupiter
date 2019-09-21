import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'taskFormTemplate', 'taskFormContainer' ]

  newTask() {
    this.taskFormContainerTarget.innerHTML = this.taskFormTemplateTarget.innerHTML
  }

  connect() {
    console.log('connected')
  }

  disconnect() {
    console.log('disconnect')
  }
}

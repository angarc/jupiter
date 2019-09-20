import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'taskListTemplate' ]

  newTaskList() {
    document.getElementById('task-list').innerHTML += this.taskListTemplateTarget.innerHTML
  }
}

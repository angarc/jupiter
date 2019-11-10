require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("trix")
require("@rails/actiontext")

import $ from 'jquery'
window.$ = $
import 'bootstrap'
import 'startbootstrap-sb-admin-2/js/sb-admin-2'

import '../src/stylesheets/application.scss'
import "controllers"

import toastr from 'toastr/toastr'
window.toastr = toastr

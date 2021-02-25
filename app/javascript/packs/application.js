import "bootstrap";
import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
require("./bootstrap");

Rails.start();
Turbolinks.start();
ActiveStorage.start();
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require jquery_ujs
$(function() {
    $('[data-toggle="tooltip"]').tooltip();
});
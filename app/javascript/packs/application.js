import "bootstrap";
import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "@fortawesome/fontawesome-free/css/all";
require("./bootstrap");

Rails.start();
Turbolinks.start();
ActiveStorage.start();

//= require popper
//= require bootstrap-sprockets
//= require jquery
//= require jquery_ujs

$(function() {
    $('[data-toggle="tooltip"]').tooltip();
});
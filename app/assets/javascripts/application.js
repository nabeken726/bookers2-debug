

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'

import "chartkick/chart.js"
import Chart from 'chart.js/auto';

Rails.start()
Turbolinks.start()
ActiveStorage.start()



global.Chart = Chart;
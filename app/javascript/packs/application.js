import "bootstrap";
import "../plugins/flatpickr";
import '../components/select2';
import '../components/guest_form_input';
import '../components/totalPrice';
import '../components/tabs';
import "dashboard";

import { soundOver } from '../components/sound';
import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();
soundOver();

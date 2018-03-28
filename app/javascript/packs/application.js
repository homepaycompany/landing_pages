import "bootstrap";
$('#carousel').carousel()
import { autocomplete } from '../shared/autocomplete'
import { goBack } from '../shared/goBack'
import { formSectionValidation } from '../shared/formSectionValidation'
import { setChoiceForm } from '../shared/formRevealElements'
import { addBooleanToForm } from '../shared/formCheckBoolean'
import { addStateToForm } from '../shared/formCheckStateBox'
import { validateAddress } from '../shared/addressValidation'
import { launchDropzone } from '../shared/dropzone'
import { toggleFaq, faqSection } from '../shared/faq'
import { filter } from "../shared/filter.js"

if (document.getElementById('js-go-back')) {
  goBack();
}

if (document.getElementById('js-validate-section')) {
  formSectionValidation()
}

if (document.getElementById('js-form-toggle-section')) {
  setChoiceForm();
}

if (document.getElementById('js-form-toggle-btn')) {
  addBooleanToForm();
}

if (document.getElementById('js-form-state-box')) {
  addStateToForm();
}

// JS to open the answer related to a specific question in FAQ
if (document.getElementById('js-faq-question')) {
  toggleFaq();
}
// JS to open the answer related to a specific topic in FAQ
if (document.querySelector('.faq-wrapper')) {
  faqSection();
}


// Do not launch JS for address autocomplete and address validation on Review apps, as Google
// browser API restrictions don't allow them to use the API
if (window.location.href.match(/homepay-rails-monolyth-st-pr-\d+/) == null) {
  // Javascript for autocomplete
  if (document.getElementById('real_estate_property_address')) {
    autocomplete();
  }

  // JS for validating the address before creating a form
  if (document.getElementById('js-form-address')) {
    validateAddress();
  }
}

// JS for launching dropzone
// JS for validating the address before creating a form
if (document.getElementById('doc-dropzone')) {
  launchDropzone();
}

// Javascript to change the format of filter on Flat#Index
if (document.querySelectorAll('.room-filter input')) {
  filter();
}

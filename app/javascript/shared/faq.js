// JS to open the answer related to a specific question in FAQ
function showQuestion() {
  const childrens = event.currentTarget.childNodes;
  const answerId = event.currentTarget.dataset.question;
  for (var i=0; i<childrens.length; i++) {
    if ((typeof childrens[i].classList !== 'undefined') && (childrens[i].classList.contains("fas"))) {
      childrens[i].classList.toggle("fa-chevron-up");
      childrens[i].classList.toggle("fa-chevron-down");
    }
  }
  const answer = document.querySelector(`#js-faq-answer[data-answer="${answerId}"]`);
  answer.classList.toggle("hidden");
}
function toggleFaq() {
  const faqs = document.querySelectorAll("#js-faq-question");
  faqs.forEach(faq => faq.addEventListener('click', showQuestion));
}


// JS to open the answer related to a specific topic in FAQ
function showFaqSection() {
  const selectedFaqSection = event.currentTarget;
  const activeFaqSection = document.querySelector(".faq-values .active");
  const topic = event.currentTarget.dataset.faq;
  const selectedWrapper = document.querySelector(`.faq-wrapper[data-faq="${topic}"]`);
  const activeWrapper = document.querySelector(".faq-wrapper-active");

  selectedFaqSection.classList.toggle("active");
  activeFaqSection.classList.toggle("active");
  selectedWrapper.classList.toggle("faq-wrapper-active");
  activeWrapper.classList.toggle("faq-wrapper-active");
}
function faqSection() {
  const faqSections = document.querySelectorAll(".faq-values h3");
  faqSections.forEach(faqSection => faqSection.addEventListener('click', showFaqSection));
}

export { toggleFaq, faqSection };

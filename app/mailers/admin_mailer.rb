class AdminMailer < ApplicationMailer
  def new_form(request)
    @request = request
    mail(to: 'admin@homepay.fr', subject: "Landing #{@request.landing} - formulaire rempli")
  end
end

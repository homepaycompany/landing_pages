class AdminMailer < ApplicationMailer
  def new_form(request)
    @request = request
    mail(to: 'admin@homepay.fr', subject: "#{@request.request_type} - formulaire rempli")
  end
end

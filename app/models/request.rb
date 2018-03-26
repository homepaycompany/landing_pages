class Request < ApplicationRecord
  after_create :send_confirmation_email

  def send_confirmation_email
    AdminMailer.new_form(self).deliver_now
  end
end

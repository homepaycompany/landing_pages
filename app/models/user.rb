class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 def self.create_instance_from_property_form(property_form)
    user = User.new
    user.first_name = property_form.first_name
    user.last_name = property_form.last_name
    user.email = property_form.email
    user.phone_number = property_form.phone_number
    user.password = '123456'
    user.password_confirmation = '123456'
    return user
 end
end

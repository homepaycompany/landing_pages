class RequestsController < ApplicationController
  def new
    @fields = personnal_information_fields
    @request = Request.new
    @type = params[:request_type] || 'seller'
  end

  def create
    r = Request.new(property_form_params)
    if r.save
      redirect_to "/thank-you"
    else
      flash[:alert] = "Un erreur est survenue - le formulaire n'a pas pu être créé"
      redirect_to root_path
    end
  end

  private

  def property_form_params
    params.require(:request).permit(:email, :first_name, :last_name, :phone_number, :request_type)
  end

  def personnal_information_fields
    a = [
          { section: 1, name: 'first_name', input_type: 'text', desc: 'Prénom', validation_type: 'string', unit: 'Jean', icon: 'form_personal_info.svg' },
          { section: 1, name: 'last_name', input_type: 'text', desc: 'Nom', validation_type: 'string', unit: 'Dupont', icon: 'form_personal_info.svg' },
          { section: 2, name: 'email', input_type: 'text', desc: 'Addresse email', validation_type: 'string', unit: 'jean.dupont@mail.com', icon: 'form_email.svg' },
          { section: 2, name: 'phone_number', input_type: 'text', desc: 'Téléphone', validation_type: 'string', icon: 'form_phone.svg' }
        ]
    sections = [{id: 1, type: 'input_section'}, {id: 2, type: 'input_section'}, {id: 3, type: 'input_section'}]
    return { sections: sections, fields: a}
  end
end

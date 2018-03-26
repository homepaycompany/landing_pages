class PropertyForm < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :property_images
  has_one :real_estate_property
  validates :token, uniqueness: true

  def dsc_1_fields
    a = [
          { section: 1, name: 'livable_size_sqm', input_type: 'text', desc: 'Surface habitable', validation_type: 'number', unit: 'm2', icon: asset_url('form_size.svg') },
          { section: 3, name: 'num_rooms', input_type: 'text', desc: 'Nb de pièces', validation_type: 'number', unit: 'nombre', icon: asset_url('form_rooms.svg') },
          { section: 3, name: 'num_bedrooms', input_type: 'text', desc: 'Nb de chambres', validation_type: 'number', unit: 'nombre', icon: asset_url('form_bedrooms.svg') },
          { section: 3, name: 'num_bathrooms', input_type: 'text', desc: 'Nb de salles de bain', validation_type: 'number', unit: 'nombre', icon: asset_url('form_bathrooms.svg') }
        ]
    if self.property_type == 'house'
      a += [
              { section: 1, name: 'property_total_size_sqm', input_type: 'text', desc: 'Surface de la propriété', validation_type: 'number', unit: 'm2', icon: asset_url('form_land_size.svg') },
              { section: 2, name: 'num_floors', input_type: 'text', desc: 'Nombre d\'étages', validation_type: 'number', unit: 'nombre', icon: asset_url('form_floor.svg') },
              { section: 2, name: 'ground_floor_size_sqm', input_type: 'text', desc: 'Surface du rez-de-chaussée', validation_type: 'number', unit: 'm2', icon: asset_url('form_ground_size.svg') }
            ]
    elsif self.property_type == 'appartment'
      a += [
              { section: 2, name: 'appartment_floor', input_type: 'text', desc: 'Etage', validation_type: 'number', unit: 'nombre', icon: asset_url('form_floor.svg') }
            ]
    end
    sections = [{id: 1, type: 'input_section'}, {id: 2, type: 'input_section'}, {id: 3, type: 'input_section'}]
    return { sections: sections, fields: a}
  end

  def dsc_2_fields
    a = [
          { section: 1, name: 'has_terrace', input_type: 'selection_box', desc: 'Terrasse', validation_type: 'boolean', connected_field: 'size_terrace_sqm', icon: asset_url('form_size.svg') },
          { section: 1, name: 'has_cellar', input_type: 'selection_box', desc: 'Cave', validation_type: 'boolean', connected_field: 'size_cellar_sqm', icon: asset_url('form_size.svg') },
          { section: 2, name: 'size_terrace_sqm', input_type: 'text', desc: 'Surface de la terrasse', validation_type: 'number', unit: 'm2', icon: asset_url('form_size.svg') },
          { section: 2, name: 'size_cellar_sqm', input_type: 'text', desc: 'Surface de la cave', validation_type: 'number', unit: 'm2', icon: asset_url('form_size.svg') }
        ]
    if self.property_type == 'house'
      a += [
            { section: 1, name: 'has_garage', input_type: 'selection_box', desc: 'Garage', validation_type: 'boolean', icon: asset_url('form_size.svg') },
            { section: 1, name: 'has_pool', input_type: 'selection_box', desc: 'Piscine', validation_type: 'boolean', icon: asset_url('form_size.svg') },
            { section: 1, name: 'has_attic', input_type: 'selection_box', desc: 'Combles', validation_type: 'boolean', connected_field: 'is_attic_convertible', icon: asset_url('form_size.svg') },
            { section: 2, name: 'is_attic_convertible', input_type: 'boolean', desc: 'Les combles sont-elles aménageables ?', validation_type: 'boolean', icon: asset_url('form_size.svg') }
            ]
    elsif self.property_type == 'appartment'
      a += [
              { section: 1, name: 'has_elevator', input_type: 'selection_box', desc: 'Ascenseur', validation_type: 'boolean', icon: asset_url('form_size.svg') },
              { section: 1, name: 'has_parking', input_type: 'selection_box', desc: 'Parking', validation_type: 'boolean', icon: asset_url('form_size.svg') },
              { section: 1, name: 'has_balcony', input_type: 'selection_box', desc: 'Balcon', validation_type: 'boolean', connected_field: 'size_balcony_sqm', icon: asset_url('form_size.svg') },
              { section: 2, name: 'size_balcony_sqm', input_type: 'text', desc: 'Surface du balcon', validation_type: 'number', unit: 'm2', icon: asset_url('form_size.svg') }
            ]
    end
    sections = [{id: 1, type: 'selection_section'}, {id: 2, type: 'hidden_input_section'}]
    return { sections: sections, fields: a}
  end

  def dsc_3_fields
    a = [
          { section: 1, name: 'building_construction_year', input_type: 'text', desc: 'Année approximative de construction', validation_type: 'number', unit: 'année', icon: asset_url('form_build_year.svg') },
          { section: 3, name: 'property_state', input_type: 'state_box', desc: 'Etat général du bien', validation_type: 'string', values: ['Neuf', 'Bon', 'Moyen', 'Mauvais'], icon: asset_url('form_size.svg') },
          { section: 4, name: 'kitchen_state', input_type: 'state_box', desc: 'Etat de la cuisine', validation_type: 'string', values: ['Neuf', 'Bon', 'Moyen', 'Mauvais'], icon: asset_url('form_size.svg') },
          { section: 5, name: 'bathroom_state', input_type: 'state_box', desc: 'Etat de la salle de bain', validation_type: 'string', values: ['Neuf', 'Bon', 'Moyen', 'Mauvais'], icon: asset_url('form_size.svg') }
        ]
    if self.property_type == 'appartment'
      a += [
            { section: 6, name: 'building_state', input_type: 'state_box', desc: 'Etat général de l\'immeuble', validation_type: 'string', values: ['Neuf', 'Bon', 'Moyen', 'Mauvais'], icon: asset_url('form_size.svg') },
            { section: 7, name: 'has_works_in_building_planned', input_type: 'boolean', desc: 'Des travaux sont-ils prévus dans l\'immeuble ?', validation_type: 'boolean', values: ['Neuf', 'Bon', 'Moyen', 'Mauvais'], icon: asset_url('form_size.svg') }
            ]
    end
    sections = [{id: 1, type: 'input_section'}, {id: 2, type: 'input_section'}, {id: 3, type: 'input_section'}, {id: 4, type: 'input_section'}, {id: 5, type: 'input_section'}, {id: 6, type: 'input_section'}, {id: 7, type: 'input_section'}]
    return { sections: sections, fields: a}
  end

  def personnal_information_fields
    a = [
          { section: 1, name: 'first_name', input_type: 'text', desc: 'Prénom', validation_type: 'string', unit: 'Jean', icon: asset_url('form_personal_info.svg') },
          { section: 1, name: 'last_name', input_type: 'text', desc: 'Nom', validation_type: 'string', unit: 'Dupont', icon: asset_url('form_personal_info.svg') },
          { section: 2, name: 'email', input_type: 'text', desc: 'Addresse email', validation_type: 'string', unit: 'jean.dupont@mail.com', icon: asset_url('form_email.svg') },
          { section: 2, name: 'phone_number', input_type: 'text', desc: 'Téléphone', validation_type: 'string', icon: asset_url('form_phone.svg') },
          { section: 3, name: 'time_to_sell', input_type: 'state_box', desc: 'Vous souhaitez vendre dans :', validation_type: 'string', values: ['Moins d\'un mois', '1 à 2 mois', '2 à 3 mois', 'Plus de 3 mois'], icon: asset_url('form_size.svg') },
        ]
    sections = [{id: 1, type: 'input_section'}, {id: 2, type: 'input_section'}, {id: 3, type: 'input_section'}]
    return { sections: sections, fields: a}
  end

  def all_pages
    return [self.dsc_1_fields, self.dsc_2_fields, self.dsc_3_fields, self.personnal_information_fields]
  end

  def asset_url(string)
    ActionController::Base.helpers.asset_url(string)
  end
end


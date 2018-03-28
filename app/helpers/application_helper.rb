module ApplicationHelper
  def active_class(link_path)
      active = current_page?(link_path) ? "active" : ""
  end
  def property_type_to_fr(type)
      if type == 'house'
        'maison'
      elsif type == 'appartment'
        'appartement'
      else
        type
      end
  end
end

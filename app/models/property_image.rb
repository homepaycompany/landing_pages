class PropertyImage < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :property_form
end

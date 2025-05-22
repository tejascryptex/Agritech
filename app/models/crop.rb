class Crop < ApplicationRecord
  
  belongs_to :user 
  has_many :crops_label, dependent: :destroy
  has_many :crop_categories, through: :crops_label
  has_many :listings

end

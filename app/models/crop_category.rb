class CropCategory < ApplicationRecord
    
  has_many :crops_label, dependent: :destroy
  has_many :crops, through: :crops_label

end

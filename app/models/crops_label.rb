class CropsLabel < ApplicationRecord
  belongs_to :crop
  belongs_to :crop_category
end

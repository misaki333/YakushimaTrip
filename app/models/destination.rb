class Destination < ApplicationRecord
  belongs_to :plan
  belongs_to :category
  belongs_to :spot
end

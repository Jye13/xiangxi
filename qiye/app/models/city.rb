class City < ApplicationRecord
  belongs_to :region

  has_many :price_rules

  has_and_belongs_to_many :categories
end

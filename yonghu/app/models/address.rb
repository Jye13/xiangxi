class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  def to_s
    self.address
  end
end

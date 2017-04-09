class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  belongs_to :user

  def to_s
    self.address
  end
end

class Station < ApplicationRecord
  has_one :address, as: :addressable

  accepts_nested_attributes_for :address

  has_and_belongs_to_many :couriers
  has_and_belongs_to_many :factories

  belongs_to :region

  has_many :deliver_waybills, as: :sender, class_name: Waybill
  has_many :pickup_waybills, as: :receiver, class_name: Waybill

  def to_s
    self.name
  end
end

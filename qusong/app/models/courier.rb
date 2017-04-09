class Courier < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :deliver_waybills, as: :sender, class_name: Waybill
  has_many :pickup_waybills, as: :receiver, class_name: Waybill

  def email_required?
    false
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if mobile = conditions.delete(:mobile)
      where(conditions.to_h).where(["mobile = :value", { :value => mobile }]).first
    elsif conditions.has_key?(:mobile)
      where(conditions.to_h).first
    end
  end

  def to_s
    self.name
  end
end

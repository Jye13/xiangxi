class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :addresses, as: :addressable
  has_many :orders

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
end

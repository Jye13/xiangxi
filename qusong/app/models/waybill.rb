class Waybill < ApplicationRecord
  belongs_to :order

  belongs_to :sender, polymorphic: true
  belongs_to :receiver, polymorphic: true

  has_one :waybill

  def can_qujian?
    self.status == 1
  end

  def yiqu
    if self.status == 1
      self.update_attributes(status: 2, actual_time: Time.now)
      true
    else
      false
    end
  end
end

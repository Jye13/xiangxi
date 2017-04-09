class Region < ApplicationRecord
  acts_as_tree order: "id"

  def to_s
    case self.level
    when 1
      "#{self.name}"
    when 2
      "#{self.parent.name} - #{self.name}"
    when 3
      "#{self.parent.parent.name} - #{self.parent.name} - #{self.name}"
    end
  end
end

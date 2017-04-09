module PriceRulesHelper
  def show_grade(grade)
    (('A'..'F').to_a)[grade - 1]
  end

  def highlight_grade(highlight_grade, grade)
    highlight_grade == grade ? 'bg-primary' : ''
  end
end

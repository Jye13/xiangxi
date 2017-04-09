class CreateCategoriesCities < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_cities do |t|
      t.references :city, foreign_key: true
      t.references :category, foreign_key: true
    end
  end
end

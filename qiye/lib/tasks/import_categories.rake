task :import_categories => :environment do
  DatabaseCleaner.strategy = :truncation, {:only => [:products, :categories]}
  DatabaseCleaner.clean


  1.upto(4).each do |i|
    category = Category.create(name: "category #{i}", logo: "category-1487430865976")

    1.upto(4).each do |j|
      product = category.products.create(name: "product #{j}", logo: "category-1487430865976")
    end
  end
end
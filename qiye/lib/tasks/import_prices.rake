task :import_prices => :environment do
  DatabaseCleaner.strategy = :truncation, {:only => [:prices]}
  DatabaseCleaner.clean

  Category.all.each_with_index do |category, c_i|
    category.products.each_with_index do |product, p_i|
      ps = {}
      1.upto(6).each do |i|
        ps["price#{i}"] = c_i * 100 + p_i * 10 + i
      end
      product.create_price(ps)
    end
  end
end
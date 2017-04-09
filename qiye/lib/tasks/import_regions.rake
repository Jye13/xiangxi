task :import_regions => :environment do
  p 'Cleaning up db data'
  DatabaseCleaner.strategy = :truncation, {:only => [:regions]}
  DatabaseCleaner.clean

  p 'import provinces'
  file = File.expand_path('./provinces.min.json', __dir__)
  datas = JSON.parse(open(file).read)
  datas.each do |data|
    Region.create(id: data['code'].to_i, name: data['name'], level: 1)
  end

  p 'import cities'
  file = File.expand_path('./cities.min.json', __dir__)
  datas = JSON.parse(open(file).read)
  datas.each do |data|
    Region.create(id: data['code'].to_i, name: data['name'], level: 2, parent_id: data['code'].to_i / 10000 * 10000)
  end

  p 'import areas'
  file = File.expand_path('./areas.min.json', __dir__)
  datas = JSON.parse(open(file).read)
  datas.each do |data|
    begin
      Region.create(id: data['code'].to_i, name: data['name'], level: 3, parent_id: data['code'].to_i / 100 * 100)  
    rescue Exception => e
      puts e
    end
  end
end
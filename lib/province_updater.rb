require 'csv'
require 'open-uri'
class ProvinceUpdater
  def initialize
    file = CSV.new(open("https://health-infobase.canada.ca/src/data/covidLive/covid19.csv"))
    if file 
      rows = file.read
      file_num_rows = rows.size - 1 #removing header from size
      db_num_rows = Province.all.size
      
      if file_num_rows > db_num_rows
        header = rows[0]
        db_num_rows = [1, db_num_rows].max #handling data entry for the first time by not including header
        body = rows.slice(db_num_rows, file_num_rows)
        update_data(header,body)

      else
        puts "No updates"
      end

    end
    
  end

  def update_data(header,body)
    failed = []
    body.each do |line|
      province = Province.new
      header.each_with_index do |key,i|
        province[key] = line[i]
      end
      if province.save
        puts "#{province.prname} saved"
      else
        failed << {name: province.prname, date: province.date, error: province.errors.messages}
      end
    end
    puts "failed:#{failed.size} rows: #{failed}"
  end
end
require 'csv'
require 'open-uri'
class ProvinceUpdater
  def initialize
    file = CSV.new(open("https://health-infobase.canada.ca/src/data/covidLive/covid19.csv"))
    if file 
      rows = file.read
      
      nfile_body_rows = rows.size - 1 #removing header from size
      ndb_rows = Province.all.size
      
      if nfile_body_rows > ndb_rows
        first_row_to_enter = ndb_rows + 1 #shifting one down to exclude header
        body = rows.slice(first_row_to_enter, nfile_body_rows)
        header = rows[0]

        hashed_body = hash_body(header, body)
        update_data(hashed_body)

      else
        puts "No updates"
      end
    end
  end

  def hash_body(header,body)
    body.map{|line| header.zip(line).to_h}
  end

  def update_data(hashed_body)
    failed = []
    hashed_body.each do |line|
      province = Province.new
      Province.column_names.each do |key|
        province[key] = line[key]
      end
      if province.save
        puts "#{province.prname} saved"
      else
        failed << {name: province.prname, date: province.date, error: province.errors.messages}
      end
    end
    puts "failed:#{failed.size} rows: #{failed}" if failed.size > 0
  end
end
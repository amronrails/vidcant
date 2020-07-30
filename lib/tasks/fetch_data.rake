require_relative '../province_updater'
namespace :fetch_data do
  task update: :environment do
    ProvinceUpdater.new()
  end
  
end

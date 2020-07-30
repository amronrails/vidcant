require_relative '../../lib/province_updater'
class UpdateProvinces
  include Sidekiq::Worker
  sidekiq_options retry: 5

  def perform
    ProvinceUpdater.new()
    puts Time.now
  end 
end
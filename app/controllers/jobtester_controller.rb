class JobtesterController < ApplicationController
  def index
    UpdateProvinces.perform_async()
  end
end

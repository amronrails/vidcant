class Province < ApplicationRecord
  before_save :check_na

  validates :prname, uniqueness: {scope: :date}

  def check_na
    self.attributes.each do |att|
      if att == "N/A"
        att = nil
      end
    end
  end
end

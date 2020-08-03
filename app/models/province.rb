class Province < ApplicationRecord  
  before_save :check_na

  validates :prname, uniqueness: {scope: :date}

  def check_na
    self.attributes.each do |key,value|
      self[key] = nil if self[key] == "N/A"
     end
  end
end

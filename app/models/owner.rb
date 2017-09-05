class Owner < ApplicationRecord
  has_many :products
  paginates_per 10

  def self.search(search)
    where("name LIKE ? OR email LIKE ? OR phone LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
  end

end

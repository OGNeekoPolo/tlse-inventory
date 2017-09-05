class Product < ApplicationRecord
  belongs_to :owner
  paginates_per 10

  def self.search(search)
    where("name LIKE ? OR item_type LIKE ? OR brand LIKE ? OR size LIKE ? OR condition LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
  end

end

class Owner < ApplicationRecord
  has_many :products
  paginates_per 10
end

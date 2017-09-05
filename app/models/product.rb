class Product < ApplicationRecord
  belongs_to :owner
  paginates_per 10
end

json.extract! product, :id, :name, :item_type, :brand, :size, :price, :condition, :created_at, :updated_at
json.url product_url(product, format: :json)

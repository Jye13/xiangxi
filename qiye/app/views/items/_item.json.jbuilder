json.extract! item, :id, :amount, :price, :product_id, :order_id, :created_at, :updated_at
json.url item_url(item, format: :json)
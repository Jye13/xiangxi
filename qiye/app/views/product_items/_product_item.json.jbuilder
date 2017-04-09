json.extract! product_item, :id, :serial, :status, :order_id, :product_id, :created_at, :updated_at
json.url product_item_url(product_item, format: :json)
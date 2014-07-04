json.array!(@products) do |product|
  json.extract! product, :id, :name, :par_kilo, :price
  json.url product_url(product, format: :json)
end

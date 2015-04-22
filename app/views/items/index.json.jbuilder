json.array!(@items) do |item|
  json.extract! item, :id, :name, :desc, :unit_px, :total_qty, :code, :item_type
  json.url item_url(item, format: :json)
end

json.array!(@checkins) do |checkin|
  json.extract! checkin, :id, :dateIn, :item_id, :source, :purpose, :serialNo, :waybillNo, :receivedBy, :sentBy
  json.url checkin_url(checkin, format: :json)
end

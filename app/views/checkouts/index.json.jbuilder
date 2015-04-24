json.array!(@checkouts) do |checkout|
  json.extract! checkout, :id, :dateOut, :checkin_id, :state, :destination, :purpose, :serial_no, :dispatchedBy, :receivedBy, :waybillNo
  json.url checkout_url(checkout, format: :json)
end

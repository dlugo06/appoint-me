json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :event, :location, :start_time, :end_time
  json.url appointment_url(appointment, format: :json)
end

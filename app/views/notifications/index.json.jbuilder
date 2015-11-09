json.array!(@notifications) do |notification|
  json.extract! notification, :id, :time, :notification_type, :user_id, :appointment_id
  json.url notification_url(notification, format: :json)
end

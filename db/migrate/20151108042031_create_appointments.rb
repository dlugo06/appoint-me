class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :event
      t.string :location
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end

class AddAddressToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :address, :string
  end
end

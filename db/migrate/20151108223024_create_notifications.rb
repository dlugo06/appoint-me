class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.datetime :time
      t.string :notification_type
      t.references :user, index: true, foreign_key: true
      t.references :appointment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

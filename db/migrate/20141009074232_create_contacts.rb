class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :device_id
      t.string :ContactName, :limit => 255
      t.string :CreatedBy, :limit => 50
      # t.datetime :CreatedDate
      t.string :ModifiedBy, :limit => 50
      # t.datetime :ModifiedDate

      t.timestamps
    end
  end
end

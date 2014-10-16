class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :UserPhoneNumber, :limit => 50
      t.string :OEMId, :limit => 255
      t.string :OS, :limit => 50
      t.decimal :Lat, :precision => 10, :scale => 6
      t.decimal :Lng, :precision => 10, :scale => 6
      t.string :CreatedBy, :limit => 50
      # t.datetime :CreatedDate
      t.string :ModifiedBy, :limit => 50
      # t.datetime :ModifiedDate

      t.timestamps
    end
  end
end



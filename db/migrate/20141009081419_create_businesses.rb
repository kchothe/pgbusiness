class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :BusinessName, :limit => 255
      t.string :BusinessType, :limit => 50
      t.string :BusinessPhone, :limit => 50
      t.integer :CityListingId
      t.string :CreatedBy, :limit => 50
      # t.datetime :CreatedDate

      t.timestamps
    end
  end
end

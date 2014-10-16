class CreateMatchedBusinesses < ActiveRecord::Migration
  def change
    # create_table :matched_businesses do |t|
    create_table :business_contact_phones do |t|
      t.integer :contact_phone_id
      t.integer :business_id
      t.boolean :IsRecommended
      t.string :CreatedBy, :limit => 50
      # t.datetime :CreatedDate
      t.string :ModifiedBy, :limit => 50
      # t.datetime :ModifiedDate

      t.timestamps
    end
  end
end

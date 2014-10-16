class CreateContactPhones < ActiveRecord::Migration
  def change
    create_table :contact_phones do |t|
      t.integer :contact_id
      t.string :PhoneNumber, :limit => 50
      t.string :PhoneNumberType, :limit => 50
      t.string :CreatedBy, :limit => 50
      # t.datetime :CreatedDate
      t.string :ModifiedBy, :limit => 50
      # t.datetime :ModifiedDate

      t.timestamps
    end
  end
end

class CreateBrokerProfiles < ActiveRecord::Migration
  def change
    create_table :broker_profiles do |t|
      t.string :company_name
      t.string :area_of_service
      t.string :contact_name
      t.string :contact_address
      t.string :contact_phone
      t.string :iata_code
      t.integer :iata_code
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

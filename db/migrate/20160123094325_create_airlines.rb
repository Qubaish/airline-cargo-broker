class CreateAirlines < ActiveRecord::Migration
  def change
    create_table :airlines do |t|
      t.string :airline_name 
      t.string :airline_address
      t.string :country
      t.string :contact_person_name
      t.string :contact_person_address
      t.string :contact_person_email
      t.bigint :contact_number
      t.string :iata_code
      t.string  :caa_license 
      t.integer :user_id
      t.integer :year_in_service

      t.timestamps null: false
    end
  end
end

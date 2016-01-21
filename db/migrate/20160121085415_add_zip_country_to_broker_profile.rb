class AddZipCountryToBrokerProfile < ActiveRecord::Migration
  def change
    add_column :broker_profiles, :zip, :string
    add_column :broker_profiles, :country, :string
  end
end

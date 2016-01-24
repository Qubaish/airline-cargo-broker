class AddAirlineIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users,:airline_id,:integer
  	remove_column :airlines,:user_id
  end
end

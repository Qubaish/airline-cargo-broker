class AddColumnUserHearInfoToUser < ActiveRecord::Migration
  def change
  	add_column :airlines, :airline_info, :string
  	add_column :broker_profiles, :broker_info, :string
  end
end

class AddColumnCaaLecineceToAirline < ActiveRecord::Migration
  def change

  	add_column :airplanes,:caa_licence,:string
  end
end

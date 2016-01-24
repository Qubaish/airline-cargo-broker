class CreateAirlineBoards < ActiveRecord::Migration
  def change
    create_table :airline_boards do |t|
	  t.string :from_airpot
      t.string :to_airpot
      t.datetime :date_available
      t.string :nature_of_cargo
      t.string :volume
      t.string :cargo_dimension_width
      t.string :cargo_dimension_length
      t.string :cargo_dimension_height
      t.integer :quantiy
      t.string :additional_information
      t.string :special_requirements

      t.integer :user_id


      t.timestamps null: false
    end
  end
end

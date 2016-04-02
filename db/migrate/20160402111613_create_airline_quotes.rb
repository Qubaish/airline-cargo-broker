class CreateAirlineQuotes < ActiveRecord::Migration
  def change
    create_table :airline_quotes do |t|
      t.string :from_airpot
      t.string :to_airpot
      t.string :cargo_dimension_width
      t.string :cargo_dimension_length
      t.string :cargo_dimension_height
      t.string :volume
      t.string :weight
      t.string :additional_information
      t.string :special_requirements
      t.integer :quantiy
      t.datetime :date_required
      t.integer :user_id
      t.timestamps null: false
    end
  end
end

class CreateBrokerQuotes < ActiveRecord::Migration
  def change
    create_table :broker_quotes do |t|
      t.string :from_airpot
      t.string :to_airpot
      t.string :to_airpot
      t.datetime :date_required
      t.string :nature_of_cargo
      t.string :un_number
      t.string :payload
      t.string :volume
      t.string :cargo_dimension_width
      t.string :cargo_dimension_length
      t.string :cargo_dimension_height
      t.integer :quantiy
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

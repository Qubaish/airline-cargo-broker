class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :user_id
      t.integer :airline_quote_id
      t.timestamps null: false
    end
  end
end

class AddBrokerQuoteIdToBids < ActiveRecord::Migration
  def change
    add_column :bids, :broker_quote_id, :integer
  end
end

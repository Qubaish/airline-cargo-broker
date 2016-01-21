class AddColumnsToBrokerQuotes < ActiveRecord::Migration
  def change
    add_column :broker_quotes, :name, :string
    add_column :broker_quotes, :company_name, :string
    add_column :broker_quotes, :email, :string
    add_column :broker_quotes, :uan_number, :string
    add_column :broker_quotes, :phone_number, :string
    add_column :broker_quotes, :hear, :string
    add_column :broker_quotes, :additional_information, :string
    add_column :broker_quotes, :special_requirements  , :string
  end
end

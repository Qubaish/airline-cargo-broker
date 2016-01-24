class Airplane < ActiveRecord::Base
belongs_to :user
validates :iata_code, presence: { message: "Story IATA code is required" }
end

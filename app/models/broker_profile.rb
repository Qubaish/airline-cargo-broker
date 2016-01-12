class BrokerProfile < ActiveRecord::Base
belongs_to :user


  def build_broker_profile
    self.save
  end
end

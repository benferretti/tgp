class DynamicPagesController < ApplicationController
  def welcome
  end

  def self.username(id)
    username = (User.find(Gossip.find(id).user_id).first_name)  + " " + (User.find(Gossip.find(id).user_id).last_name)
  end
end

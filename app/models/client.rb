class Client < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_many :projects
end

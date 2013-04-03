class Project < ActiveRecord::Base
  attr_accessible :client_id, :description, :name
  has_many :pages
end

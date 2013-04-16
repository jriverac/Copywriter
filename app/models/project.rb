class Project < ActiveRecord::Base
  attr_accessible :client_id, :description, :name

  belongs_to :client
  has_many :pages
end

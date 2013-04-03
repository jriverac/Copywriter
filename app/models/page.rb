class Page < ActiveRecord::Base
  attr_accessible :body, :order, :parent, :project_id, :title
  belongs_to :project
end

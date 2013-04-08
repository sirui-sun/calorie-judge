class Food < ActiveRecord::Base
  attr_accessible :calorie, :company, :name, :number, :serving_size, :source, :tags
end

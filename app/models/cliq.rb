class Cliq < ActiveRecord::Base
  include ActsAsNestedInterval

  acts_as_nested_interval

  has_many :topics
end

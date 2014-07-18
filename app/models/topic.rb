class Topic < ActiveRecord::Base
  belongs_to :cliqs
  has_many :posts
end

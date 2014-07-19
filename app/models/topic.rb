class Topic < ActiveRecord::Base
  belongs_to :cliq
  has_many :post
end

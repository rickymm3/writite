class Topic < ActiveRecord::Base
  belongs_to :cliq
  has_many :post

  belongs_to :user
  has_many :replies

end

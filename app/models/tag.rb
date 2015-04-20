class Tag < ActiveRecord::Base
  has_many :tags_mystories
  has_many :mystories, through: :tags_mystories
end

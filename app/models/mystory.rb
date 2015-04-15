class Mystory < ActiveRecord::Base
  belongs_to :user
  has_many :chapters
  has_many :tag_lists

  attr_accessor :new_tags
end
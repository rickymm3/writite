class Mystory < ActiveRecord::Base
  acts_as_punchable
  attachment :image, content_type: ["image/jpeg", "image/png"]

  belongs_to :user
  has_many :chapters

  has_many :tags_mystories, dependent: :destroy
  has_many :tags, through: :tags_mystories

  attr_accessor :new_tags

end
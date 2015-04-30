class Chapter < ActiveRecord::Base
  acts_as_punchable
  belongs_to :mystory
end
class Chapter < ActiveRecord::Base
  belongs_to :mystory
  is_impressionable :counter_cache => true

end
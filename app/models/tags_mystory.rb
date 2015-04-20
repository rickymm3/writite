class TagsMystory < ActiveRecord::Base
  belongs_to :mystory
  belongs_to :tag
end

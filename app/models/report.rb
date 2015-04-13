class Report < ActiveRecord::Base
  belongs_to :reply
  belongs_to :topic
end

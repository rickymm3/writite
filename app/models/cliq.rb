class Cliq < ActiveRecord::Base
  include ActsAsNestedInterval
  acts_as_nested_interval
  has_many :topic, :foreign_key => 'cliq_id'

  def self.similar_search(search)
    if search
      where('name LIKE ?', "%#{search.downcase}%")
    else
      scoped
    end
  end

  def self.matching_search(search)
    if search
      where('name = ?', "#{search.downcase}")
    else
      scoped
    end
  end
end

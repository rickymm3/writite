class Cliq < ActiveRecord::Base
  include ActsAsNestedInterval
  acts_as_nested_interval
  has_many :topic, :foreign_key => 'cliq_id'

  def self.search(search, current_cliq)
    hash = Hash.new
    hash['results'] = Cliq.similar_search(search)
    hash['match'] = Cliq.matching_search(search).first
    unless hash['match']
      hash['temp'] = Cliq.new(name:search, parent: current_cliq)
    end
    hash
  end

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

class Tournament < ActiveRecord::Base
  has_many :videos

  scope :like, ->(q) { where('name LIKE ?', "%#{q}%") }
  scope :year_and_like, ->(y, q) { where('year = ? and name LIKE ?', y, "%#{q}%") }

  def year_and_name
    "#{year} #{name}"
  end

  def self.years
    order(year: 'desc').pluck(:year).uniq
  end

  def to_s
    year_and_name
  end
end

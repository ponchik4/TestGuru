class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :test_passages
  has_many :users, through: :test_passages
  has_many :questions

  validates :title, presence: true, uniqueness: { scope: :level }

  scope :level, -> (level) { where(level: level) }
  scope :easy, -> { level(0, 1) }
  scope :medium, -> { level(2, 3, 4) }
  scope :hard, -> { level(5..Float::INFINITY) }
  scope :by_category, -> (category) { joins(:category).where(categories: { title: category }) }

  def find_by_category(category)
    by_category(category).order(title: :desc).pluck(:title)
  end
end

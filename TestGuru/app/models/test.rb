class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :passed_tests
  has_many :users, through: :passed_tests
  has_many :questions

  validates :title, presence :true
                    uniqueness :true
  validates :level, numercality :true { only_integer :true}
                    uniqueness :true

  scope :level, -> (level) { where(level: level) }
  scope :easy, -> { level(0, 1) }
  scope :medium, -> { level(2, 3, 4) }
  scope :hard, -> { level(5..Float::INFINITY) }
  scope :by_category, -> (category) { joins(:category).where(categories: { title: category }) }
end

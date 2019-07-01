class Test < ApplicationRecord

  def find_by_category(category)
  Test.joins('JOIN categories ON categories.id = tests.category_id').
  where(categories: { title: category }).
  order(title: :desc).
  pluck(:title)
  end

  belongs_to :category
  has_many :questions
  has_many :users
  has_many :passed_tests
end

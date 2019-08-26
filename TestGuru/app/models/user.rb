class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test'
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :name, presence: true

  def find_tests_by_level(test_level)
    Test.joins('join user_tests on user_tests.tests_id = tests.id').where(passed_tests: { user_id: id }, level: test_level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end

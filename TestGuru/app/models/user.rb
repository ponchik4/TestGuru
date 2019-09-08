require 'digest/sha1'

class User < ApplicationRecord

#  include Auth

  validates :email, :with => /@/, :uniqueness => true

  has_many :created_tests, class_name: 'Test', foreign_key: :user_id
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_secure_password

  def find_tests_by_level(test_level)
    Test.joins('join user_tests on user_tests.tests_id = tests.id').where(passed_tests: { user_id: id }, level: test_level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end

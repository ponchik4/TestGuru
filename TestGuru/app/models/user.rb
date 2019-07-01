class User < ApplicationRecord

  def find_tests_by_level(test_level)
    Test.joins('join user_tests on user_tests.tests_id = tests.id').where(passed_tests: { user_id: id }, level: test_level)
  end

  has_many :passed_tests
  has_one :tests
end

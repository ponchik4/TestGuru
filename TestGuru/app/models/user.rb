class User < ApplicationRecord

  def find_tests_by_level(test_level)
    Test.joins(:passed_tests).where(passed_tests: { user_id: id }, level: test_level)
  end
end

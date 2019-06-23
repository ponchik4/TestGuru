class User < ApplicationRecord

  def find_tests_by_level(test_level)
    tests = Test.where(level: test_level)
    tests.each do |test|
      PassedTest.where(user_id: self, test_id: test.id)
    end
  end
end

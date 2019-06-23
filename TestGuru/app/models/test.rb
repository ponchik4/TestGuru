class Test < ApplicationRecord

  def self.find_by_category(category)
    Test.where(category_id: category).order(title: :desc)
  end
end

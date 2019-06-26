class Test < ApplicationRecord

  def find_by_category(category)
    Test.joins(:categories).where(categories: { user_id: id }, category: category)
  end
end

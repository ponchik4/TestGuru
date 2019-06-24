class Test < ApplicationRecord

  def find_by_category(category)
    SELECT
    tests.category_id,
    categories.title
    FROM categories
    INNER JOIN categories ON tests.category_id
  end
end

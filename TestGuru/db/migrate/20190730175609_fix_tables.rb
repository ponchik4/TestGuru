class FixTables < ActiveRecord::Migration[5.2]
  def change
    remove_column :answers, :answers_id, :integer
    remove_column :answers, :test_id, :integer
    remove_column :questions, :questions_id, :integer
    remove_column :questions, :title, :string
  end
end

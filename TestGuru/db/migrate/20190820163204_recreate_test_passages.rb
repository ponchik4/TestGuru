class RecreateTestPassages < ActiveRecord::Migration[5.2]
  def change
    drop_table :test_passages
    create_table :test_passages do |t|
      t.references :test, foreign_key: true
      t.references :user, foreign_key: true
      t.references "current_question"
      t.integer "correct_questions", default: 0
      t.timestamps
    end
  end
end

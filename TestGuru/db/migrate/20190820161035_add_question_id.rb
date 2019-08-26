class AddQuestionId < ActiveRecord::Migration[5.2]
  def change
    drop_table :passed_tests
    drop_table :test_passages
    create_table :test_passages do |t|
      t.references :test, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :question_id
      t.timestamps
    end
  end
end

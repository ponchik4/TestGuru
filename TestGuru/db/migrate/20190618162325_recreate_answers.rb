class RecreateAnswers < ActiveRecord::Migration[5.2]
  def change
    drop_table :answers
    create_table :answers do |t|
      t.integer :question_id
      t.boolean :correct, default: false
      t.string :answer, null: false
      t.references :answers, :test, foreign_key: true

      t.timestamps
    end
  end
end

class RecreateQuestions < ActiveRecord::Migration[5.2]
  def change
    drop_table :questions
    create_table :questions do |t|
      t.string :title, null: false
      t.string :question, null: false
      t.references :questions, :test, foreign_key: true

      t.timestamps
    end

  end
end

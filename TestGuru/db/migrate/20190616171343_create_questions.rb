class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :question, null: false

      t.timestamps
    end
    add_reference :tests, :question, foreign_key: true
  end
end

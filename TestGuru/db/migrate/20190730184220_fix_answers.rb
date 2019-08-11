class FixAnswers < ActiveRecord::Migration[5.2]
  def change
     add_index(:answers, :question_id)
  end
end

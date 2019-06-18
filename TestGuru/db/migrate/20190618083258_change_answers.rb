class ChangeAnswers < ActiveRecord::Migration[5.2]
  def change
    change_table :answers do |t|
      t.remove :title
    end
  end
end

class ChangeTests < ActiveRecord::Migration[5.2]
  def change
    change_table :tests do |t|
      add_column :tests, :user_id, :integer
    end
  end
end

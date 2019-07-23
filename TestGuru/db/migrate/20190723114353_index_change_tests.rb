class IndexChangeTests < ActiveRecord::Migration[5.2]
  def change
    change_table :tests do |t|
      add_index :tests, [:title, :level]
    end
  end
end

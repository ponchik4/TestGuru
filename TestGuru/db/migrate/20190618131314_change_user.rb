class ChangeUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.remove :title
    end
  end
end

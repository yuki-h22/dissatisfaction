class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sort_status, :integer
  end
end

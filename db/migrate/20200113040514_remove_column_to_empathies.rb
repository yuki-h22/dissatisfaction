class RemoveColumnToEmpathies < ActiveRecord::Migration[5.2]
  def change
    remove_column :empathies, :bitch_id, :bigint
  end
end

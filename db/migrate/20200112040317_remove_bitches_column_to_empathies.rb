class RemoveBitchesColumnToEmpathies < ActiveRecord::Migration[5.2]
  def change
    rename_column :empathies, :bitches_id, :bitch_id
  end
end

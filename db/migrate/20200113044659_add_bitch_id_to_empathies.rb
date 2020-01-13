class AddBitchIdToEmpathies < ActiveRecord::Migration[5.2]
  def change
    add_reference :empathies, :bitch, foreign_key: true
  end
end

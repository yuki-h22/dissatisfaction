class CreateEmpathies < ActiveRecord::Migration[5.2]
  def change
    create_table :empathies do |t|
      t.references :bitches
      t.references :user
      t.timestamps
    end
  end
end

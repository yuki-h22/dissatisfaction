class CreateBitches < ActiveRecord::Migration[5.2]
  def change
    create_table :bitches do |t|
      t.text   :comment
      t.string :user_id
      t.string :score
      t.string :category
      t.timestamps
    end
  end
end

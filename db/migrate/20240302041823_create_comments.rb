class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.string :user_id
      t.integer :row_number
      t.text :text

      t.timestamps
    end
  end
end

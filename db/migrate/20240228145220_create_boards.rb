class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :title
      t.text :description
      t.boolean :is_deleted

      t.timestamps
    end
  end
end

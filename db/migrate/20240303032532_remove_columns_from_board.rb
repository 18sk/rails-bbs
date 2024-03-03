class RemoveColumnsFromBoard < ActiveRecord::Migration[7.1]
  def change
    remove_column :boards, :user_id
    remove_column :boards, :description
  end
end

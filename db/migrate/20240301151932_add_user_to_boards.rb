class AddUserToBoards < ActiveRecord::Migration[7.1]
  def change
    add_column :boards, :user_id, :string
  end
end

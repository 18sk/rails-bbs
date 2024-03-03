class AlterTableAddReferenceToBoards < ActiveRecord::Migration[7.1]
  def change
    add_reference :boards, :comment, index: true, foreign_key: true
  end
end

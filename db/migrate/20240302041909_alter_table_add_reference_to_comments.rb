class AlterTableAddReferenceToComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :board, index: true, foreign_key: true
  end
end

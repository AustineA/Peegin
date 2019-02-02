class AddUserIdToPeegins < ActiveRecord::Migration[5.1]
  def change
    add_column :peegins, :user_id, :integer
    add_index :peegins, :user_id
  end
end

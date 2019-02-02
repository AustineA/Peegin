class AddOriginToPeegin < ActiveRecord::Migration[5.1]
  def change
    add_column :peegins, :origin, :string
  end
end

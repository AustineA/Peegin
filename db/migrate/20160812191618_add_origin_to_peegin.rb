class AddOriginToPeegin < ActiveRecord::Migration
  def change
    add_column :peegins, :origin, :string
  end
end

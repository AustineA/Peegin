class AddPermalinkToPeegin < ActiveRecord::Migration
  def change
    add_column :peegins, :permalink, :string
  end
end

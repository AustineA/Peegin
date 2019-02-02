class AddCleanToPeegins < ActiveRecord::Migration[5.1]
  def change
    add_column :peegins, :clean, :boolean, :default => true
  end
end

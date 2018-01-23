class AddCleanToPeegins < ActiveRecord::Migration
  def change
    add_column :peegins, :clean, :boolean, :default => true
  end
end

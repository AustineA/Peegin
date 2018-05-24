class AddImpressionsCountToPeegins < ActiveRecord::Migration
  def change
    add_column :peegins, :impressions_count, :integer, :default => 0
    add_index :peegins, :impressions_count
  end
end

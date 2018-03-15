class AddImpressionsCountToPeegin < ActiveRecord::Migration
  def change
    add_column :peegins, :impressions_count, :integer, default: 0
  end
end

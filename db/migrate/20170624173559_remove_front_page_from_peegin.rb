class RemoveFrontPageFromPeegin < ActiveRecord::Migration
  def change
    remove_column :peegins, :front_page, :boolean
  end
end

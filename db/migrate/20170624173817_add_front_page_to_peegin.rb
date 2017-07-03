class AddFrontPageToPeegin < ActiveRecord::Migration
  def change
    add_column :peegins, :front_page, :boolean, :default => false
  end
end

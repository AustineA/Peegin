class AddFrontPageToPeegin < ActiveRecord::Migration[5.1]
  def change
    add_column :peegins, :front_page, :boolean, :default => false
  end
end

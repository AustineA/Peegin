class AddBasicPhraseToPeegin < ActiveRecord::Migration
  def change
    add_column :peegins, :basic_phrase, :boolean, :default => false
  end
end

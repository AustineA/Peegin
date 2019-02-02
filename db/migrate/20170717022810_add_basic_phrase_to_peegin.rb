class AddBasicPhraseToPeegin < ActiveRecord::Migration[5.1]
  def change
    add_column :peegins, :basic_phrase, :boolean, :default => false
  end
end

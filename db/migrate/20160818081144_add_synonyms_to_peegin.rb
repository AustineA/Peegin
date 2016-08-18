class AddSynonymsToPeegin < ActiveRecord::Migration
  def change
    add_column :peegins, :synonyms, :string
  end
end

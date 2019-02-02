class AddSynonymsToPeegin < ActiveRecord::Migration[5.1]
  def change
    add_column :peegins, :synonyms, :string
  end
end

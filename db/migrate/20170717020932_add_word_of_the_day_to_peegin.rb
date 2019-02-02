class AddWordOfTheDayToPeegin < ActiveRecord::Migration[5.1]
  def change
    add_column :peegins, :word_of_the_day, :boolean, :default => false
  end
end

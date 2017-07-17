class AddWordOfTheDayToPeegin < ActiveRecord::Migration
  def change
    add_column :peegins, :word_of_the_day, :boolean, :default => false
  end
end

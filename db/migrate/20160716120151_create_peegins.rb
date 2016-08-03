class CreatePeegins < ActiveRecord::Migration
  def change
    create_table :peegins do |t|
      t.string :title
      t.string :meaning
      t.string :example

      t.timestamps null: false
    end
  end
end

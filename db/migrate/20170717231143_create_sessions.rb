class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.string :ip

      t.timestamps null: false
    end
  end
end

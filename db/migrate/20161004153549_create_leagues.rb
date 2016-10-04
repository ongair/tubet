class CreateLeagues < ActiveRecord::Migration[5.0]
  def change
    create_table :leagues do |t|
      t.string :code
      t.string :name
      t.boolean :active, default: true

      t.timestamps
    end
  end
end

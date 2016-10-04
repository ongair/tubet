class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :code
      t.string :name
      t.string :nickname
      t.string :image_url
      t.string :promo_gif_url
      t.references :league, foreign_key: true

      t.timestamps
    end
  end
end

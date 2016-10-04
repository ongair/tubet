class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :username
      t.string :phone_number
      t.string :source
      t.string :profile_pic_url
      t.string :external_id
      t.string :state
      t.string :level
      t.integer :credits
      t.boolean :terms_accepted
      t.boolean :beta

      t.timestamps
    end
  end
end

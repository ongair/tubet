class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :username
      t.string :phone_number
      t.string :source
      t.string :profile_pic_url
      t.string :external_id
      t.string :state, default: 'new'
      t.boolean :active, default: false
      t.string :level, default: '0'
      t.integer :credits, default: 0
      t.boolean :terms_accepted, default: false
      t.boolean :beta, default: false

      t.timestamps
    end
  end
end

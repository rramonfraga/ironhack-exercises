class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :address
      t.string :phoneNumber
      t.string :emailAddress

      t.timestamps null: false
    end
  end
end

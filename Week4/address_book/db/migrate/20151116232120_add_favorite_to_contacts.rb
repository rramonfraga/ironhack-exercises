class AddFavoriteToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :favorite, :bool
  end
end

class AddUserIdToContacts < ActiveRecord::Migration[7.0]
  def change
    add_column :contacts, :user_id, :string
  end
end

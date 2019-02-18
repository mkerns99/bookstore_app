class AddColumnsToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :email, :string
    add_column :authors, :middle_name, :string
    add_column :authors, :last_activity, :datetime, default: Time.zone.now
  end
end

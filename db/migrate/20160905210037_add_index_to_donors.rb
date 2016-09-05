class AddIndexToDonors < ActiveRecord::Migration[5.0]
  def change
    add_index :donors, :email, unique: true
  end
end

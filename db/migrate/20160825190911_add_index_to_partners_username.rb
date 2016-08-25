class AddIndexToPartnersUsername < ActiveRecord::Migration[5.0]
  def change
    add_index :partners, :username, unique: true
  end
end

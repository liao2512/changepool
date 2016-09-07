class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
    add_index :admins, :email, unique: true
  end
end
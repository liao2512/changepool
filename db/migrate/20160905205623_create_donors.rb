class CreateDonors < ActiveRecord::Migration[5.0]
  def change
    create_table :donors do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_digest
      t.date :birthday
      t.string :country
      t.text :bio
      t.boolean :monthly_fund
      t.boolean :anual_fund
      t.boolean :anonymous

      t.timestamps
    end
  end
end

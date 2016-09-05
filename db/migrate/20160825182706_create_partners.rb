class CreatePartners < ActiveRecord::Migration[5.0]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :contact_name
      t.string :email_2
      t.string :contact_name_2
      t.string :partner_type
      t.text   :address
      t.text   :description
      t.string :phone
      t.integer :case_count
      t.decimal :average_cost
      t.decimal :average_update_time

      t.timestamps
    end
  end
end

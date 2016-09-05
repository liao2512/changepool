class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :campaign_type
      t.text :description
      t.decimal :target_funding
      t.decimal :current_funding
      t.date :target_deadline
      t.text :notes
      t.string :status
      t.string :banner_image
      t.references :partner, foreign_key: true

      t.timestamps
    end
    add_index :campaigns, [:partner_id, :created_at]
  end
end

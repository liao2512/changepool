class AddRememberDigestToPartners < ActiveRecord::Migration[5.0]
  def change
    add_column :partners, :remember_digest, :string
  end
end

class AddPasswordDigestToPartners < ActiveRecord::Migration[5.0]
  def change
    add_column :partners, :password_digest, :string
  end
end

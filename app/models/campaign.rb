class Campaign < ApplicationRecord
  belongs_to :partner
  default_scope -> { order(created_at: :desc) }
  validates :partner_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
end

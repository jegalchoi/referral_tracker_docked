class Referral < ApplicationRecord
  validates :user_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_requested, presence: true
end

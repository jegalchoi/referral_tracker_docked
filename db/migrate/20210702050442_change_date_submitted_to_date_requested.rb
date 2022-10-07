class ChangeDateSubmittedToDateRequested < ActiveRecord::Migration[6.0]
  def change
    rename_column :referrals, :date_submitted, :date_requested
  end
end

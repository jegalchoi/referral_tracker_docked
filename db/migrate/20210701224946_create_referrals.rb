class CreateReferrals < ActiveRecord::Migration[6.0]
  def change
    create_table :referrals do |t|
      t.string :user_id
      t.string :first_name
      t.string :last_name
      t.string :date_submitted
      t.string :status

      t.timestamps
    end
  end
end

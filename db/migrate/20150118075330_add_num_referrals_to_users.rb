class AddNumReferralsToUsers < ActiveRecord::Migration
  def change
  	add_column :spree_users, :num_referrals, :integer, default: 0
  end
end

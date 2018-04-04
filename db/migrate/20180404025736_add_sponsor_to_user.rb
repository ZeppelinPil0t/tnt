class AddSponsorToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sponsor, :string
  end
end

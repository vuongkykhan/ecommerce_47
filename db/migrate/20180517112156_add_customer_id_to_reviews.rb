class AddCustomerIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :customer_id, :integer
  end
end

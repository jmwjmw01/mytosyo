class AddRentalIdToBook < ActiveRecord::Migration
  def change
    add_column :books, :Rental_id, :integer
  end
end

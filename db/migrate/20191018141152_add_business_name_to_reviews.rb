class AddBusinessNameToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :business_name, :string
  end
end

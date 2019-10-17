class AddAssociateToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :associate, :string
  end
end

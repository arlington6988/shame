class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :story
      t.integer :business_id
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreateBusinessTable < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.string :business
      t.string :name
      t.string :address
      t.integer :rating
    end
  end
end

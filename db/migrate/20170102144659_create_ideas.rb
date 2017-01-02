class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.integer :user_id
      t.string :date_title
      t.string :date_description
      t.string :price_category

      t.timestamps

    end
  end
end

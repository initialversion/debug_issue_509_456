class CreateHelpfulRatings < ActiveRecord::Migration
  def change
    create_table :helpful_ratings do |t|
      t.integer :review_id
      t.boolean :helpful_rate
      t.integer :user_id

      t.timestamps

    end
  end
end

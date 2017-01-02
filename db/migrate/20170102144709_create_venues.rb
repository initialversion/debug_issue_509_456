class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.integer :date_id
      t.string :venue_title
      t.string :venue_description
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :website_url

      t.timestamps

    end
  end
end

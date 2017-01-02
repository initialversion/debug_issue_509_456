class CreateVenueDateRelations < ActiveRecord::Migration
  def change
    create_table :venue_date_relations do |t|
      t.integer :date_id
      t.integer :venue_id
      t.string :information

      t.timestamps

    end
  end
end

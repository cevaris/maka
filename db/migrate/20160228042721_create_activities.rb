class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :creator_id
      t.string :title
      t.string :slug
      t.text :description

      t.timestamps null: false
    end
  end
end

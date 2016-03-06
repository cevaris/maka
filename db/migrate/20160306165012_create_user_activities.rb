class CreateUserActivities < ActiveRecord::Migration
  def change
    create_table :user_activities do |t|
      t.integer :user_id
      t.integer :activity_id
      t.integer :status
      t.datetime :accepted_at
      t.datetime :completed_at

      t.timestamps null: false
    end
  end
end

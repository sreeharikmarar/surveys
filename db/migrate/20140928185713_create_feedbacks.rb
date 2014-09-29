class CreateFeedbacks < ActiveRecord::Migration
  def up
    create_table :feedbacks do |t|
      t.integer :user_id
      t.integer :survey_id
      t.timestamps
    end

    add_index :feedbacks , :user_id
    add_index :feedbacks , :survey_id
  end

  def down
  	remove_index :feedbacks , :user_id
  	remove_index :feedbacks , :survey_id
  	drop_table :feedbacks
  end
end

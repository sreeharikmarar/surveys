class CreateQuestions < ActiveRecord::Migration
  def up
    create_table :questions do |t|
    	t.string :text
    	t.integer :survey_id
    	t.string :type
    	t.timestamps
    end
    add_index :questions , :survey_id
  end

  def down
  	remove_index :questions , :survey_id
  	drop_tabe :questions
  end

end

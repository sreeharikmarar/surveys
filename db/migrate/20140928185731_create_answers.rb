class CreateAnswers < ActiveRecord::Migration
  
  def up
    create_table :answers do |t|
      t.integer :question_id
      t.integer :feedback_id
      t.string :answer

      t.timestamps
    end

    add_index :answers , :question_id
    add_index :answers , :feedback_id
  end

  def down
  	remove_index :answers , :question_id
    remove_index :answers , :feedback_id

    drop_table :answers
  end
end

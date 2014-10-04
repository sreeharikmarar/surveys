class CreateOptions < ActiveRecord::Migration
  
  def up
    create_table :options do |t|
    	t.integer :question_id
    	t.string :value
    end

    add_index :options , :question_id
  end

  def down
  	remove_index :options , :question_id
  	drop_table :options
  end
end

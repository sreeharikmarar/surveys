class CreateOptions < ActiveRecord::Migration
  
  def up
    create_table :options do |t|
    	t.integer :question_id
      t.string :type
    	t.string :option_1
    	t.string :option_2
    	t.string :option_3
    	t.string :option_4
    end

    add_index :options , :question_id
  end

  def down
  	remove_index :options , :question_id
  	drop_table :options
  end
end

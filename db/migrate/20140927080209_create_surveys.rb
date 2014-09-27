class CreateSurveys < ActiveRecord::Migration
  def up
    create_table :surveys do |t|
    	t.string :title
    	t.string :description
    	t.boolean :is_published , :default => false
    	t.integer :no_of_questions
    	t.timestamps
    end
  end

  def down
  	drop_table :surveys
  end
end

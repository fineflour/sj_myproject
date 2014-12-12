class CreateTodos < ActiveRecord::Migration
  
  def up 
    create_table(:todos) do |t|
        t.integer :user_id
        t.string :description
        t.integer :status_id
        t.datetime :created_at, :null => false, :default => Time.now
        t.datetime :status_updated_at
             
        t.timestamps
    end
  end
end

class CreateTableQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :title
      t.string :body
      t.datetime :created_at
      t.datetime :update_at
    end
  end
end

class CreateTagsTodoItems < ActiveRecord::Migration
  def change
    create_table :tags_todo_items, id:false do |t|
      t.references :todo_item
      t.references :tag
    end
  end
end

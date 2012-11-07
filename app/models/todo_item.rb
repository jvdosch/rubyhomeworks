class TodoItem < ActiveRecord::Base

  attr_accessible :due_date, :task_title, :description
  belongs_to :todo_list
  has_and_belongs_to_many :tags

  # order items by due date with the earliest first
  default_scope order('todo_items.due_date ASC')

  def to_s
    "Task Title: " + task_title + "  Due Date: " + due_date.to_s + "  Description: " + description
  end
end

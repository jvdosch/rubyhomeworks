class TodoList < ActiveRecord::Base

  attr_accessible :list_name, :list_due_date
  belongs_to :user
  has_many :todo_items

  # order lists by due date with the earliest first
  default_scope order('todo_lists.list_due_date ASC')

  def to_s
    "Name: " + list_name + "  Due Date: " + list_due_date.to_s
  end
end

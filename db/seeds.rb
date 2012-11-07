# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# start fresh
Tag.delete_all
TodoItem.delete_all
TodoList.delete_all
Account.delete_all
User.delete_all

# create all the users
User.create [
  {login: 'jdoe', password: 'Password'},
  {login: 'cismail', password: 'Password123'},
  {login: 'mbrown', password: '123456'}
]

# create accounts for all the users
users = User.all
users[0].account = Account.create(:gender => 'male', :age => 34, :first_name => 'John', :last_name => 'Doe' )
users[1].account = Account.create(:gender => 'N/A', :age => 23, :first_name => 'Chris', :last_name => 'Ismail' )
users[2].account = Account.create(:gender => 'female', :age => 50, :first_name => 'Megan', :last_name => 'Brown' )

# create some todo lists
users[0].todo_lists.create [
  {:list_name => 'random stuff', :list_due_date => DateTime.now + 3},
  {:list_name => 'more stuff', :list_due_date => DateTime.now + 1},
  {:list_name => 'unimportant stuff', :list_due_date => DateTime.now}
]
users[1].todo_lists.create [
  {:list_name => 'just stuff', :list_due_date => DateTime.now + 3},
  {:list_name => 'really important stuff', :list_due_date => DateTime.now}
]
users[2].todo_lists.create [
  {:list_name => 'stuff', :list_due_date => DateTime.now },
  {:list_name => 'important stuff', :list_due_date => DateTime.now + 1}
]

# create some tags
Tag.create [
  {tag_name: 'tag1'},
  {tag_name: 'tag2'},
  {tag_name: 'tag3'},
  {tag_name: 'tag4'},
  {tag_name: 'tag5'}
]

tags = Tag.all

# create some todo items
todo_lists = users[0].todo_lists
todo_lists[0].todo_items.create [
  {:due_date => DateTime.now - 4, :task_title => 'task 1', :description => 'description 1'},
  {:due_date => DateTime.now,     :task_title => 'task 2', :description => 'description 2'},
  {:due_date => DateTime.now - 2, :task_title => 'task 3', :description => 'description 3'}
]
items = todo_lists[0].todo_items.all
items[0].tags << tags[2]
items[0].tags << tags[0]
items[1].tags << tags[2]
items[2].tags << tags[4]
items[2].tags << tags[1]
todo_lists[1].todo_items.create [
  {:due_date => DateTime.now - 1, :task_title => 'task 4', :description => 'description 4'},
  {:due_date => DateTime.now,     :task_title => 'task 5', :description => 'description 5'}
]

todo_lists = users[1].todo_lists
todo_lists[0].todo_items.create [
  {:due_date => DateTime.now - 1, :task_title => 'task 4', :description => 'description 4'},
  {:due_date => DateTime.now,     :task_title => 'task 5', :description => 'description 5'}
]
items = todo_lists[0].todo_items.all
items[0].tags << tags[2]
items[0].tags << tags[0]
items[1].tags << tags[2]
items[1].tags << tags[4]
items[1].tags << tags[3]

todo_lists = users[2].todo_lists
todo_lists[0].todo_items.create [
  {:due_date => DateTime.now - 3, :task_title => 'task 6', :description => 'description 6'},
  {:due_date => DateTime.now - 2, :task_title => 'task 7', :description => 'description 7'} ,
  {:due_date => DateTime.now,     :task_title => 'task 8', :description => 'description 8'},
  {:due_date => DateTime.now - 1, :task_title => 'task 9', :description => 'description 9'}
]
items = todo_lists[0].todo_items.all
items[0].tags << tags[2]
items[0].tags << tags[0]
items[1].tags << tags[2]
items[1].tags << tags[4]
items[1].tags << tags[3]
items[2].tags << tags[0]
items[2].tags << tags[1]
items[2].tags << tags[2]
items[3].tags << tags[3]

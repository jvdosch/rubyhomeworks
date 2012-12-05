require_relative '../config/environment'

# 4: In addition to being able to get to TodoItems from TodoLists, map TodoItems directly on the User model.

user = User.all.first

puts
puts
puts "=========================================================================="
puts " (4) Showing TodoItems access from User"
puts "=========================================================================="
user.todo_items.each {
  |item|
  puts item
}

puts "=========================================================================="
puts " (4) Showing TodoItems access from TodoLists"
puts "=========================================================================="
user.todo_lists[0].todo_items.each {
    |item|
  puts item
}
puts "=========================================================================="
puts
puts

# 5: Validate that gender field (on Account model) only accepts: “male”, “female” or “N/A” values and age field can
#    only accept an integer for its input.

puts "=========================================================================="
puts " (5) Showing male, female, and N/A work for gender and positive number for age"
puts "=========================================================================="
account = Account.create(:gender => 'male', :age => 34, :first_name => 'John', :last_name => 'Doe' )
puts account
Account.delete account
account = Account.create(:gender => 'female', :age => 34, :first_name => 'Jane', :last_name => 'Doe' )
puts account
Account.delete account
account = Account.create(:gender => 'N/A', :age => 34, :first_name => 'N', :last_name => 'A' )
puts account
Account.delete account

puts "=========================================================================="
puts " (5) Showing other inputs for gender don't work "
puts "=========================================================================="
account = Account.create(:gender => 'fdmale', :age => 34, :first_name => 'John', :last_name => 'Doe' )
puts account.errors[:gender]

puts "=========================================================================="
puts " (5) Showing letters for age doesn't works "
puts "=========================================================================="
account = Account.create(:gender => 'male', :age => 'fds', :first_name => 'John', :last_name => 'Doe' )
puts account.errors[:age]

puts "=========================================================================="
puts " (5) Showing negative numbers for age doesn't works "
puts "=========================================================================="
account = Account.create(:gender => 'male', :age => -4, :first_name => 'John', :last_name => 'Doe' )
puts account.errors[:age]
puts "=========================================================================="
puts
puts

# 6: Create a default scope for TodoItem and TodoList that will return them in due date ascending order (by default),
#    so that I can see the ones due soon first.

puts "=========================================================================="
puts " (6) TodoItems are returned in due date ascending order by default"
puts "=========================================================================="
user.todo_items.each {
    |item|
  puts item.due_date.to_s
}

puts "=========================================================================="
puts " (6) TodoLists are returned in due date ascending order by default"
puts "=========================================================================="
user.todo_lists.each {
  |list|
  puts list.list_due_date.to_s
}
puts "=========================================================================="
puts
puts

# Show User's Account
puts "=========================================================================="
puts " User's Account"
puts "=========================================================================="
puts user.account
puts "=========================================================================="
puts " User's TodoLists"
puts "=========================================================================="
user.todo_lists.each {
  |list|
  puts list
}
puts "=========================================================================="
puts " User's TodoItems"
puts "=========================================================================="
user.todo_items.each {
  |item|
  puts item
}
puts "=========================================================================="
puts " TodoList's items"
puts "=========================================================================="
user.todo_lists[0].todo_items.each {
  |item|
  puts item
}
puts "=========================================================================="
puts " TodoItem's tags"
puts "=========================================================================="
user.todo_lists[0].todo_items[0].tags.each {
  |tag|
  puts tag
}
puts "=========================================================================="
puts " Tag's TodoItems"
puts "=========================================================================="
tag = Tag.all.first
tag.todo_items.each {
  |item|
  puts item
}
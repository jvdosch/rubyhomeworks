class Tag < ActiveRecord::Base

  attr_accessible :tag_name
  has_and_belongs_to_many :todo_items

  def to_s
    tag_name
  end

end

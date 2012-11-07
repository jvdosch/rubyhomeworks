class Account < ActiveRecord::Base

  attr_accessible :gender, :age, :first_name, :last_name
  belongs_to :user

  # age must be greater than 0
  validates :age, :numericality => {:only_integer => true, :greater_than => 0}

  # gender must be 'male', 'female', or 'N/A'
  validate :gender_type
  def gender_type
    if gender != 'male' && gender != 'female' && gender != 'N/A'
      errors.add(:gender, 'must be either: male, female, or N/A')
    end
  end

  def to_s
    "First Name: " + first_name + "  Last Name: " + last_name + "  Age: " + age.to_s + "  Gender: " + gender
  end
end

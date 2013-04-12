class Student
  attr_accessor :student_id, :first_name, :last_name, :city, :state,
                :email, :gender, :pounds, :gpa, :taking_courses

  def initialize
    yield self if block_given?
  end

  def eql? another
    self.student_id == another.student_id
  end

  def hash
    self.student_id
  end

  def to_s
      if @taking_courses.count > 0
        course_string = @taking_courses.join(', ')
      else
        course_string = 'N/A'
      end

     "Name: #{@first_name} #{@last_name} (#{@student_id}) " +
     " (#{@gender} from #{@city}, #{@state}, weight: #{pounds}, GPA: #{@gpa})" +
     "\nEmail: #{@email}" +
     "\nCourses: #{course_string}"
  end
end
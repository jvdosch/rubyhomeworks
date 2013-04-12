require_relative 'student'
require_relative 'course'
require 'csv'
require 'yaml'

courses = {1 => Course.new(1, "Course 1"),
           2 => Course.new(2, "Course 2"),
           3 => Course.new(3, "Course 3"),
           4 => Course.new(4, "Course 4")}

students = []

total_students = 0
# read file using using CSV library
CSV.parse(File.read('students.csv'), :headers => true).each {
  |row|
  students.push Student.new {
    |s|
    total_students += 1
    s.student_id = total_students
    s.first_name = row[0]
    s.last_name = row[1]
    s.city = row[3]
    s.state = row[4]
    s.email = row[6]
    s.gender = row[7]
    s.pounds = row[8].to_f
    s.gpa = rand(2.0..4.0)

    #set up courses
    arr = courses.keys.combination(rand(0..courses.count)).to_a
    s.taking_courses = arr[rand(0..(arr.count-1))].map {
      |num|
      courses[num]
    }
  }
}

# create the yaml file
File.open('university_db.yml', 'w+') {
  |file|
  file.write(students.to_yaml)
}
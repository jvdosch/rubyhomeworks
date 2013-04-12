require_relative 'student'
require_relative 'course'
require 'yaml'

class DbApi
  @@all_students = YAML.load(File.open('university_db.yml'))
  def self.students
    @@all_students
  end

  def self.select_by_gender (gender)
    @@all_students.select {
      |student|
      student.gender == gender
    }
  end

  def self.select_by_first_name (first_name)
    @@all_students.select {
      |student|
      student.first_name =~ /#{first_name}/
    }
  end

  def self.select_by_last_name (last_name)
    @@all_students.select {
      |student|
      student.last_name =~ /#{last_name}/
    }
  end

  def self.select_by_weight_more_than (pounds)
    @@all_students.select {
      |student|
      student.pounds > pounds
    }
  end

end

require_relative 'student'
require_relative 'course'
require 'yaml'

class DbApi
  @@all_students = YAML.load(File.open('university_db.yml'))

  def self.method_missing (method, *args)

    # assuming methods are like: select_students_where_[variable name]
    arr = method.to_s.split('_')
    variable = arr[3..arr.length-1].join('_')

    @@all_students.select {
      |student|
      student.send(variable).send(args[0], args[1])
    }

  end

end

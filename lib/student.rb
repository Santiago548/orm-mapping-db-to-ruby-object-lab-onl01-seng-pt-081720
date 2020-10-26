class Student
  attr_accessor :name, :grade, :id

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade TEXT
      )
      SQL

      DB[:conn].execute(sql)
    end

    def self.drop_table
      sql = "DROP TABLE IF EXISTS students;"
      DB[:conn].execute(sql)
    end

    def save
      sql = <<-SQL
        INSERT INTO students (name, grade)
        VALUES (?, ?)
      SQL

      DB[:conn].execute(sql, self.name, self.grade)
      @id = DB[:conn].last_insert_row_id
    end

    def self.new_from_db(row)
      student = Student.new
      student.id = row[0]
      student.name = row[1]
      student.grade = row[2]
      student
    end

    def self.find_by_name

    end

    def self.all_students_in_grade_9
      sql = <<-SQL
        SELECT * FROM students
        WHERE grade = 9
      SQL

      DB[:conn].execute(sql)
    end

    def self.students_below_12th_grade
      sql = <<-SQL
        SELECT * FROM students
        WHERE grade < 12
      SQL

      DB[:conn].execute(sql, self.name, self.grade).each do |row|
        row
    end
end

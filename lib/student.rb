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

end

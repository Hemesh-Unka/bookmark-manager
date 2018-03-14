require 'pg'

class DatabaseConnection
  def self.setup(db_name)
    @connection = PG.connect(dbname: db_name)
  end

  def self.query(query)
    @connection.exec(query)
  end
# this avoids class_variable_get command
  def self.connection
    @connection
  end
end

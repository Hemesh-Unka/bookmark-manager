require 'pg'

task :test_database_setup do
  # connect to the database
  connection = PG.connect(dbname: 'bookmark_manager_test')

  # clear the test data
  p 'Cleaning previous database...'
  connection.exec('TRUNCATE comments, links;')

  p 'Populating test database...'
  # Insert test data
  connection.exec("INSERT INTO links VALUES(1, 'Makers Academy', 'http://www.makersacademy.com');")
  connection.exec("INSERT INTO links VALUES(2, 'Google', 'http://www.google.com');")
  connection.exec("INSERT INTO links VALUES(3, 'Facebook', 'http://www.facebook.com');")
  p 'Completed populating test database'
end

task :setup do
  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
    connection = PG.connect
    p "Setting up #{database} from scratch..."
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE links(id SERIAL PRIMARY KEY, title VARCHAR(60), url VARCHAR(60));")
    p "#{database} database setup completed"
  end
end

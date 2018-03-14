require 'pg'

task :test_database_setup do
  # connect to the database
  connection = PG.connect(dbname: 'bookmark_manager_test')

  # clear the test data
  p 'Cleaning previous database...'
  connection.exec('TRUNCATE links;')

  p 'Populating test database...'
  # Insert test data
  connection.exec("INSERT INTO links VALUES(1, 'http://www.makersacademy.com');")
  connection.exec("INSERT INTO links VALUES(2, 'http://www.google.com');")
  connection.exec("INSERT INTO links VALUES(3, 'http://www.facebook.com');")
  p 'Completed populating test database'
end

task :setup do
  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
    connection = PG.connect
    p "Setting up #{database} from scratch..."
    connection.exec("CREATE DATABASE #{database};")
    connection.exec("CREATE #{database} ('id' SERIAL PRIMARY KEY, url VARCHAR(60));")
    p "#{database} database setup completed"
  end
end

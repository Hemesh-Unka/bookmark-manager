p 'Setting up test database...'

require 'pg'
# connect to the database
connection = PG.connect(dbname: 'bookmark_manager_test')

# clear the test data
connection.exec('TRUNCATE links;')

# Insert test data
connection.exec("INSERT INTO links VALUES(1, 'http://www.makersacademy.com');")
connection.exec("INSERT INTO links VALUES(2, 'http://www.google.com');")
connection.exec("INSERT INTO links VALUES(3, 'http://www.facebook.com');")

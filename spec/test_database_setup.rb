require 'pg'
# connect to the database
p 'Setting up test database...'

connection = PG.connect(dbname: 'bookmark_manager_test')

# clear the test data
p 'Clearing test database...'
connection.exec('TRUNCATE links;')

# Insert test data
connection.exec("INSERT INTO links VALUES(1, 'http://www.makersacademy.com');")
connection.exec("INSERT INTO links VALUES(2, 'http://www.google.com');")
connection.exec("INSERT INTO links VALUES(3, 'http://www.facebook.com');")

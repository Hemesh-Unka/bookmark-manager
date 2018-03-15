require 'pg'
require 'uri'
require_relative 'database_connection'

class Link
  def self.all
    result = DatabaseConnection.query('SELECT * FROM links')
    result.map { |link| link['url'] }
  end

  def self.create(options)
    return false unless is_url?(options[:url])
    DatabaseConnection.query("INSERT INTO links (url) VALUES('#{options[:url]}')")
  end

  def self.is_url?(url)
    url =~ /\A#{URI::DEFAULT_PARSER.make_regexp}\z/
  end
end

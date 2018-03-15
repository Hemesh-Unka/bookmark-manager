require 'pg'
require 'uri'
require_relative 'database_connection'

class Link
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM links;')
    result.map { |link| Link.new(link['id'], link['url'], link['title']) }
  end

  def self.create(options)
    return false unless is_url?(options[:url])
    DatabaseConnection.query("INSERT INTO links (title, url) VALUES('#{options[:title]}','#{options[:url]}');")
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM links WHERE id = #{id};")
  end

  def self.is_url?(url)
    url =~ /\A#{URI::DEFAULT_PARSER.make_regexp}\z/
  end
end

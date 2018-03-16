require 'pg'
require 'uri'
require_relative 'database_connection'

class Link
  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM links;')
    result.map { |link| Link.new(link['id'], link['title'], link['url']) }
  end

  def self.create(options)
    return false unless is_url?(options[:url])
    DatabaseConnection.query("INSERT INTO links (title, url) VALUES('#{options[:title]}','#{options[:url]}');")
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM links WHERE id = #{id};")
  end

  def self.select(id)
    result = DatabaseConnection.query("SELECT id, title, url FROM links WHERE id = #{id};")[0]
    Link.new(result['id'], result['title'], result['url'])
  end

  def self.update(id, params)
    DatabaseConnection.query("UPDATE links SET title='#{params[:title]}', url='#{params[:url]}' WHERE id = #{id};")
  end

  def self.is_url?(url)
    url =~ /\A#{URI::DEFAULT_PARSER.make_regexp}\z/
  end
end

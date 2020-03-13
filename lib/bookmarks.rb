require "pg"

class Bookmark

  attr_reader :id, :url, :title

  def initialize(id:, url:, title:)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    # if ENV["ENVIRONMENT"] == "test"
    #   connection = PG.connect(dbname: "bookmark_manager_test")
    # else
    #   connection = PG.connect(dbname: "bookmark_manager")
    # end

    result = DatabaseConnection.query("SELECT * FROM bookmarks;")
    result.map do |bookmark|
      Bookmark.new(id: bookmark["id"], url: bookmark["url"], title: bookmark["title"])
    end
  end

  def self.create(url:, title:)
    return false unless is_url?(url)
    # if ENV["ENVIRONMENT"] == "test"
    #   connection = PG.connect(dbname: "bookmark_manager_test")
    # else
    #   connection = PG.connect(dbname: "bookmark_manager")
    # end
    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}','#{title}') RETURNING id, url, title;")
    Bookmark.new(id: result[0]["id"], url: result[0]["url"], title: result[0]["title"])
  end

  def self.delete(id:)
    # if ENV["ENVIRONMENT"] == "test"
    #   connection = PG.connect(dbname: "bookmark_manager_test")
    # else
    #   connection = PG.connect(dbname: "bookmark_manager")
    # end
    DatabaseConnection.query("DELETE FROM bookmarks where id = #{id};")
  end

  def self.update(id:, url:, title:)
    # if ENV["ENVIRONMENT"] == "test"
    #   connection = PG.connect(dbname: "bookmark_manager_test")
    # else
    #   connection = PG.connect(dbname: "bookmark_manager")
    # end
    result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = '#{id}' RETURNING id, url, title;")
    Bookmark.new(id: result[0]["id"], url: result[0]["url"], title: result[0]["title"])
  end

  def self.find(id:)
    # if ENV["ENVIRONMENT"] == "test"
    #   connection = PG.connect(dbname: "bookmark_manager_test")
    # else
    #   connection = PG.connect(dbname: "bookmark_manager")
    # end
    result = DatabaseConnection.query("SELECT * FROM bookmarks where id = #{id};")
    Bookmark.new(id: result[0]["id"], url: result[0]["url"], title: result[0]["title"])
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end


end

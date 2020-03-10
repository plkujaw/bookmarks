require "bookmarks"

describe Bookmark do
  describe ".all" do
    it "returns all bookmarks" do
      connection = PG.connect(dbname: "bookmark_manager_test")

      # Add the test data
      Bookmark.create(url: "https://google.com")
      Bookmark.create(url: "https://makers.tech")
      Bookmark.create(url: "https://linkedin.com")

      bookmarks = Bookmark.all

      expect(bookmarks).to include("https://google.com")
      expect(bookmarks).to include("https://makers.tech")
      expect(bookmarks).to include("https://linkedin.com")
    end
  end

  describe ".create" do
    it "creates a new bookmark" do
      Bookmark.create(url: "http://testbookmark.com")

      expect(Bookmark.all).to include("http://testbookmark.com")
    end
  end
end

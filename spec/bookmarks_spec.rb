require "bookmarks"

describe Bookmark do
  describe ".all" do
    it "returns all bookmarks" do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("https://google.co.uk")
      expect(bookmarks).to include("https://twitter.com")
      expect(bookmarks).to include("https://linkedin.com")
    end
  end
end

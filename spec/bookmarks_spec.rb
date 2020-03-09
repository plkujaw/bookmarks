require "bookmarks"

describe Bookmark do
  describe ".all" do
    it "returns all bookmarks" do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("https://google.com")
      expect(bookmarks).to include("https://makers.tech")
      expect(bookmarks).to include("https://linkedin.com")
    end
  end
end

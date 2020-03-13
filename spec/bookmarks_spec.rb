require "bookmarks"
require "database_helpers"

describe Bookmark do
  describe ".all" do
    it "returns all bookmarks" do
      # connection = PG.connect(dbname: "bookmark_manager_test")

      # Add the test data
      bookmark = Bookmark.create(url: "https://google.com", title: "Google")
      Bookmark.create(url: "https://makers.tech", title: "Makers")
      Bookmark.create(url: "https://linkedin.com", title: "LinkedIn")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq(3)
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.url).to eq("https://google.com")
      expect(bookmarks.first.title).to eq("Google")
    end
  end

  describe ".create" do
    it "creates a new bookmark" do
      bookmark = Bookmark.create(url: "http://testbookmark.com", title: "Test Bookmark Title")
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data["id"]
      expect(bookmark.url).to eq("http://testbookmark.com")
      expect(bookmark.title).to eq("Test Bookmark Title")
    end
  end

  describe ".delete" do
    it "deletes the given bookmark" do
      bookmark = Bookmark.create(url: "http://testbookmark.com", title: "Test Bookmark")

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq(0)
    end
  end

  describe ".update" do
    it "updates the bookmarks details with given data" do
      bookmark = Bookmark.create(url: "https://makersacademy.com", title: "Makers Academy")
      updated_bookmark = Bookmark.update(id: bookmark.id, url: "https://makers.tech", title: "Makers")

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq(bookmark.id)
      expect(updated_bookmark.url).to eq("https://makers.tech")
      expect(updated_bookmark.title).to eq("Makers")
    end
  end

  describe ".find" do
    it "returns requested bookmark object" do
      bookmark = Bookmark.create(url: "https://makersacademy.com", title: "Makers Academy")

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq(bookmark.id)
      expect(result.url).to eq("https://makersacademy.com")
      expect(result.title).to eq("Makers Academy")
    end
  end


end

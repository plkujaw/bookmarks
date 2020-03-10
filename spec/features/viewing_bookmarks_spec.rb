feature "viewing a bookmarks" do
  scenario "user visiting a index page can see the bookmarks" do
    visit ("/")
    expect(page).to have_content("Bookmarks Manager")
  end


  scenario "user visiting /bookmarks page will see the list of bookmarks" do
    connection = PG.connect(dbname: "bookmark_manager_test")

    # Add the test data
    Bookmark.create(url: "https://google.com")
    Bookmark.create(url: "https://makers.tech")
    Bookmark.create(url: "https://linkedin.com")

    visit ("/bookmarks")

    expect(page).to have_content("https://google.com")
    expect(page).to have_content("https://linkedin.com")
    expect(page).to have_content("https://makers.tech")
  end
end

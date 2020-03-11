feature "viewing a bookmarks" do
  scenario "user visiting a index page can see the bookmarks" do
    visit ("/")
    expect(page).to have_content("Bookmarks Manager")
  end


  scenario "user visiting /bookmarks page will see the list of bookmarks" do
    # connection = PG.connect(dbname: "bookmark_manager_test")

    # Add the test data
    Bookmark.create(url: "https://google.com", title: "Google")
    Bookmark.create(url: "https://makers.tech", title: "Makers")
    Bookmark.create(url: "https://linkedin.com", title: "LinkedIn")

    visit ("/bookmarks")

    expect(page).to have_link("Google", href: "https://google.com")
    expect(page).to have_link("Makers", href: "https://makers.tech" )
    expect(page).to have_link("LinkedIn", href: "https://linkedin.com")
  end
end

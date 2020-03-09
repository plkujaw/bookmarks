feature "viewing a bookmarks" do
  scenario "user visiting a index page can see the bookmarks" do
    visit ("/")
    expect(page).to have_content("Bookmarks Manager")
  end


  scenario "user visiting /bookmarks page will see the list of bookmarks" do
    visit ("/bookmarks")
    expect(page).to have_content("https://google.co.uk")
    expect(page).to have_content("https://twitter.com")
    expect(page).to have_content("https://linkedin.com")
  end
end

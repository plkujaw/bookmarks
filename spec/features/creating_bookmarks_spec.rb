feature "adding new bookmark" do
  scenario "user adds a new bookmark using a form" do
    visit("/bookmarks/new")
    fill_in("url", with: "https://testbookmark.com")
    fill_in("title", with: "Test Bookmark Title")
    click_button("Submit")

    expect(page).to have_link("Test Bookmark Title", href: "https://testbookmark.com")
  end
end

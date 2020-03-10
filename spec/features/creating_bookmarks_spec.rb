feature "adding new bookmark" do
  scenario "user adds a new bookmark using a form" do
    visit("/bookmarks/new")
    fill_in("url", with: "https://testbookmark.com")
    click_button("Submit")

    expect(page).to have_content("https://testbookmark.com")
  end
end

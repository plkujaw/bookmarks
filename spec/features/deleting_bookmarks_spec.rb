feature "deleting a bookmark" do
  scenario "user can delete a bookmark" do
    Bookmark.create(url: "https://testbookmark.com", title: "Test bookmark")
    visit("/bookmarks")
    expect(page).to have_link("Test bookmark", href: "https://testbookmark.com")

    first(".bookmark").click_button("Delete")

    expect(current_path).to eq("/bookmarks")
    expect(page).not_to have_link("Test bookmark", href: "https://testbookmark.com")
  end
end

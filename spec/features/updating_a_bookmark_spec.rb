feature "updating a bookmark" do
  scenario "user can update a bookmarks details" do
    bookmark = Bookmark.create(url: "https://makersacademy.com", title: "Makers Academy")
    visit("/bookmarks")
    expect(page).to have_link("Makers Academy", href: "https://makersacademy.com")

    first(".bookmark").click_button("Edit")
    expect(current_path).to eq("/bookmarks/#{bookmark.id}/edit")

    fill_in("url", with: "https://makers.tech")
    fill_in("title", with: "Makers Tech")
    click_button("Submit")

    expect(current_path).to eq("/bookmarks")
    expect(page).not_to have_link("Makers Academy", href: "https://makersacademy.com")
    expect(page).to have_link("Makers Tech", href: "https://makers.tech")
  end
end

require "sinatra/base"
require "./lib/bookmarks"

class BookmarkManager < Sinatra::Base

  get "/" do
    "Bookmarks Manager"
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb :"bookmarks/index"
  end

  run! if app_file == $0
end

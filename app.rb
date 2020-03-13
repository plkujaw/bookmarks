require "sinatra/base"
require "./lib/bookmarks"

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  delete "/bookmarks/:id" do
    Bookmark.delete(id: params[:id])
    redirect "/bookmarks"
  end

  get "/bookmarks/:id/edit" do
    @bookmark = Bookmark.find(id: params[:id])
    erb :"bookmarks/edit"
  end

  patch "/bookmarks/:id" do
    Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
    redirect("/bookmarks")
  end

  get "/" do
    "Bookmarks Manager"
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb :"bookmarks/index"
  end

  get "/bookmarks/new" do
    erb :"bookmarks/new"
  end

  post "/bookmarks" do
    Bookmark.create(title: params[:title], url: params[:url])
    redirect "/bookmarks"
  end

  run! if app_file == $0
end

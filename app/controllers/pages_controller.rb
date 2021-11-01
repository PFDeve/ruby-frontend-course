class PagesController < ApplicationController
  def index
    @posts = Post.where("name LIKE ?", "%#{params[:search]}%")
  end
end

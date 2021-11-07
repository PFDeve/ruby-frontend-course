class PagesController < ApplicationController
  def index
    @posts = Post.where("name LIKE ?", "%#{params[:query]}%")

    respond_to do |format|
      format.html
      format.json { render json: { posts: @posts } }
    end
  end
end

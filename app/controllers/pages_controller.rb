class PagesController < ApplicationController
  def import_date
  end

  def import
    CsvImporterWorker.perform_async(Note::CSV_PATH)
  end

  def index
    @posts = Post.where("name LIKE ?", "%#{params[:query]}%")

    respond_to do |format|
      format.html
      format.json { render json: { posts: @posts } }
    end
  end
end

class PagesController < ApplicationController
  def import
    @notes = Note.all
  end

  def import_date
    CsvImporterWorker.perform_async(Note::CSV_PATH)

    redirect_to import_path
  end

  def index
    @posts = Post.where("name LIKE ?", "%#{params[:query]}%")

    respond_to do |format|
      format.html
      format.json { render json: { posts: @posts } }
    end
  end
end

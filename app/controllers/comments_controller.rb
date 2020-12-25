class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @link, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }

      else
        format.html { render action: 'new' }
        format.json { redner json: @comment.errors, status: :unprocessable_entity }

      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Comment was successfully Removed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:link_id, :body, :user_id)
  end
end
